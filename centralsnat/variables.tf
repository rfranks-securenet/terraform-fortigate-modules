variable "centralsnatmap" {
  description = "Central SNATs to create"
  default     = []

  type = list(object({
    policyid              = optional(number)
    uuid                  = optional(string)
    status                = optional(string)
    type                  = optional(string)
    orig_addr             = optional(list(string), [])
    orig_addr6            = optional(list(string), [])
    srcintf               = list(string)
    dst_addr              = optional(list(string), [])
    dst_addr6             = optional(list(string), [])
    dstintf               = list(string)
    custom_tags           = optional(list(string), [])
    nat_ippool            = optional(list(string), [])
    nat_ippool6           = optional(list(string), [])
    port_preserve         = optional(string)
    port_random           = optional(string)
    protocol              = number
    orig_port             = number
    nat_port              = optional(number)
    dst_port              = optional(number)
    nat                   = string
    nat46                 = optional(string)
    nat64                 = optional(string)
    comments              = optional(string)
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool, false)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.status == null || contains(["enable", "disable"], o.status)]))
    error_message = "Parameter `status` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.type == null || contains(["ipv4", "ipv6"], o.type)]))
    error_message = "Parameter `type` must be one of `ipv4`, `ipv6`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.port_preserve == null || contains(["enable", "disable"], o.port_preserve)]))
    error_message = "Parameter `port_preserve` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.port_random == null || contains(["enable", "disable"], o.port_random)]))
    error_message = "Parameter `port_random` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.protocol == null || (o.protocol >= 0 && o.protocol <= 255)]))
    error_message = "Parameter `protocol` must be in the range 0-255."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.orig_port == null || (o.orig_port >= 0 && o.orig_port <= 65535)]))
    error_message = "Parameter `orig_port` must be in the range 0-65535."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.nat_port == null || (o.nat_port >= 0 && o.nat_port <= 65535)]))
    error_message = "Parameter `nat_port` must be in the range 0-65535."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.dst_port == null || (o.dst_port >= 0 && o.dst_port <= 65535)]))
    error_message = "Parameter `dst_port` must be in the range 0-65535."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.nat == null || contains(["disable", "enable"], o.nat)]))
    error_message = "Parameter `nat` must be one of `disable`, `enable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.nat46 == null || contains(["enable", "disable"], o.nat46)]))
    error_message = "Parameter `nat46` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.nat64 == null || contains(["enable", "disable"], o.nat64)]))
    error_message = "Parameter `nat64` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.centralsnatmap : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}
