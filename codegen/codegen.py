#!/usr/bin/env python3

import logging
import os
from os.path import dirname, realpath
import shutil
import subprocess

import TfVar

logger = logging.getLogger("codegen")

mypath = dirname(realpath(__file__))
repopath = f"{dirname(mypath)}"

logging.basicConfig(level=logging.INFO)

modules = {}

sources = [f for f in os.listdir(f"{mypath}/sources/") if f[-4:] == ".csv"]

for source in sources:
    logger.info("Processing source %s", source)
    with open(f"{mypath}/sources/{source}", "r", encoding="UTF-8") as fh:
        lines = fh.readlines()

    provider, module, resource = source[:-4].split("_", 3)

    tfvars = []
    tfvarsall = {}
    module = None

    topVar = TfVar.TfVar()
    topVar.topLevel(resource, "")

    for line in lines:
        if line.find("Variable,Type,Values,Value range,Required") > -1:
            logger.debug("Skipping header line")
            # Skip the header line
            continue
        if line[:1] == "#":
            colon = line.find(":")
            if colon == -1:
                logger.warning("Found invalid meta argument: %s", line)
            meta = line[1:colon]
            value = line[colon + 1 :].strip().rstrip(",")
            if meta == "desc":
                # Processing description line
                topVar._description = value
            if meta == "name":
                # Processing name line
                topVar._name = value
            if meta == "module":
                module = value
            continue
        logging.debug("Processing line %s", line)
        tfvar = TfVar.TfVar()
        tfvar.fromLine(line)
        if tfvar.ancestry != "":
            tfvarsall[tfvar.ancestry].addChild(tfvar)
            tfvarsall[tfvar.fullname] = tfvar
        else:
            tfvarsall[tfvar.fullname] = tfvar
            topVar.addChild(tfvar)

    if module is None:
        logger.error(
            "Module not defined for variable %s; cannot write out", topVar.name
        )
        continue
    try:
        modules[module].append(topVar.render())
    except KeyError:
        modules[module] = [topVar.render()]

for name in modules:
    logger.info("Writing out module %s", name)
    with open(f"{repopath}/{name}/variables.tf", "w", encoding="UTF-8") as fh:
        fh.write("\n".join(modules[name]))
    opentofu = shutil.which("tofu")
    if opentofu is None:
        logger.warning("Cannot find opentofu in path - not formatting output")
        continue
    subprocess.run([opentofu, "fmt", f"{repopath}/{name}/variables.tf"])
