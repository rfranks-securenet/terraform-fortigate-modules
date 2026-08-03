import re
import logging

logger = logging.getLogger(__name__)

types = ["object", "string", "number", "bool"]


class TfVar:
    _pattern = re.compile(
        r"^([\w\.]+),([\w\(\)]+),([\w\|\-\.]*),([\d\-]*),(\d{0,1}),([\w\"]*),(?:\"?)(.*?)(?:\"?)$"
    )

    def __init__(self):
        self._name = ""
        self._fullname = ""
        self._type = ""
        self._is_list = False
        self._valid_values = None
        self._valid_range = None
        self._required = False
        self._default = None
        self._ancestors = []
        self._familyLevel = 0
        self._description = ""
        self._children = []
        self._parent = None

    def topLevel(self, name, description):
        self._type = "object"
        self._name = name
        self._is_list = True
        self._default = "[]"
        self._familyLevel = -1

    def fromLine(self, line: str) -> None:
        matches = self._pattern.match(line)
        if matches is None:
            raise TfVarInvalidMatchException()
        varname, vartype, validvalues, valuerange, required, default, description = (
            matches.groups()
        )

        logger.debug("Matched default '%s'", default)

        if validvalues != "" and valuerange != "":
            raise TfVarInvalidValueListException(
                "Cannot define value list and value range for the same variable"
            )

        if validvalues != "":
            self._valid_values = validvalues.split("|")
        if valuerange != "":
            parts = valuerange.split("-")
            if len(parts) != 2:
                raise TfVarInvalidValueRangeException(
                    "Value range should be in format <low>-<high>"
                )
            low = int(parts[0])
            self._valid_range = {"low": low}
            if parts[1] != "":
                high = int(parts[1])
                if high <= low:
                    raise TfVarInvalidValueRangeException(
                        "The range start should be lower than the range end"
                    )
                self._valid_range["high"] = high

        if required != "":
            self._required = True

        if vartype.find("list") > -1:
            if not self._required:
                self._default = "[]"
            self._is_list = True
            self._type = vartype.replace("list(", "")[:-1]
        else:
            self._type = vartype

        if not self._type in types:
            raise TfVarInvalidTypeException(f"{self._type} is not a valid type")

        if default != "":
            if self._type == "string":
                self._default = f'"{default}"'
            else:
                self._default = default

        working_name = varname
        while working_name.find(".") > -1:
            this_parent = working_name[: working_name.find(".")]
            self._ancestors.append(this_parent)
            working_name = working_name[working_name.find(".") + 1 :]
            self._familyLevel += 1
        self._name = working_name
        self._fullname = varname

    @property
    def ancestry(self) -> str:
        return ".".join(self._ancestors)

    @property
    def parent(self):
        return self._parent

    @property
    def fullname(self) -> str:
        return self._fullname

    @property
    def name(self) -> str:
        return self._name

    @property
    def validationName(self) -> str:
        if self._parent._is_list:
            return self.name
        else:
            return f"{self._parent.name}.{self.name}"

    def addChild(self, child) -> None:
        if self._type != "object":
            raise TfVarInvalidChildException("Cannot add child to non-object parent")
        if child.ancestry != self._fullname and self._familyLevel >= 0:
            raise TfVarInvalidChildException("Invalid child")
        child._parent = self
        self._children.append(child)

    def render(self) -> str:
        if self._familyLevel != -1:
            raise TfVarCouldNotRenderException("Cannot render non top-level var")

        out = f"variable {self._name} {{\n"
        indent = "  "
        out += f'{indent}description = "{self._description}"\n'
        out += f"{indent}default = {self._default}\n\n"
        out += f"{indent}type = "
        if self._is_list:
            out += "list("
        if self._type == "object":
            out += "object({\n"
            for child in self._children:
                out += child._generateDefinition()
            out += f"{indent}}})"
        else:
            out += self._type
        if self._is_list:
            out += ")\n"

        validation = ""
        for child in self._children:
            validation += child._generateValidation(self._name)

        if validation != "":
            out += "\n"
            out += validation
        out += "}\n"
        return out

    def _generateDefinition(self) -> str:
        indent = " " * (self._familyLevel + 2) * 2
        out = f"{indent}{self._name} = "
        if not self._required:
            out += "optional("
        if self._is_list:
            out += "list("
        if self._type == "object":
            out += "object({\n"
            for child in self._children:
                out += child._generateDefinition()
            out += f"{indent}"
            out += "})"
        else:
            out += self._type
        if self._is_list:
            out += ")"
        if self._default:
            out += f", {self._default}"
        if not self._required:
            out += ")"
        out += "\n"
        return out

    def _generateValidation(self, topName: str) -> str:
        out = ""
        if self._valid_range or self._valid_values:
            out = "  validation {\n"
            out += f"    condition = alltrue(flatten([for o in var.{topName} : "
            parents = []
            thisObject = self
            listLevel = 0
            for i in range(self._familyLevel):
                thisObject = thisObject.parent
                parents.append(thisObject)
            for i in range(self._familyLevel):
                thisObject = parents.pop()
                if thisObject._is_list:
                    out += f"[ for {chr(112 + listLevel)} in {chr(111 + listLevel)}.{thisObject.validationName} : "
                    listLevel += 1
                else:
                    out += f" {chr(111 + listLevel)}.{thisObject.validationName} == null || "
            error = ""
            if self._valid_values:
                if self._type == "string":
                    out += f"{chr(111 + listLevel)}.{self.validationName} == null || contains([\"{'","'.join(self._valid_values)}\"], {chr(111 + listLevel)}.{self.validationName})"
                elif self._type == "number":
                    out += f"{chr(111 + listLevel)}.{self.validationName} == null || contains([{','.join(self._valid_values)}], {chr(111 + listLevel)}.{self.validationName})"
                error = f"Parameter `{self._fullname}` must be one of `{'`, `'.join(self._valid_values)}`."

            if self._valid_range:
                try:
                    high = self._valid_range["high"]
                    out += f"{chr(111 + listLevel)}.{self.validationName} == null || ({chr(111 + listLevel)}.{self.validationName} >= {self._valid_range['low']} && {chr(111 + listLevel)}.{self.validationName} <= {self._valid_range['high']})"
                    error = f"Parameter `{self._fullname}` must be in the range {self._valid_range['low']}-{self._valid_range['high']}."
                except KeyError:
                    out += f"{chr(111 + listLevel)}.{self.validationName} == null || {chr(111 + listLevel)}.{self.validationName} >= {self._valid_range['low']}"
                    error = f"Parameter `{self._fullname}` must be {self._valid_range['low']} or greater."
            out += "]" * listLevel
            out += "]))\n"
            out += f'    error_message = "{error}"\n'
            out += "  }\n"

        for child in self._children:
            out += child._generateValidation(topName)
        return out

        pass


class TfVarException(Exception):
    pass


class TfVarInvalidMatchException(TfVarException):
    pass


class TfVarInvalidValueListException(TfVarException):
    pass


class TfVarInvalidValueRangeException(TfVarException):
    pass


class TfVarInvalidTypeException(TfVarException):
    pass


class TfVarInvalidChildException(TfVarException):
    pass


class TfVarCouldNotRenderException(TfVarException):
    pass
