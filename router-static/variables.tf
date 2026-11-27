variable "static_route6" {
  description = "Static Router configuration"
  default     = []

  type = list(object({
    seq_num         = optional(string)
    status          = optional(string)
    dst             = optional(string)
    gateway         = optional(string)
    device          = string
    devindex        = optional(string)
    distance        = optional(string)
    weight          = optional(string)
    priority        = optional(string)
    comment         = optional(string)
    blackhole       = optional(string)
    dynamic_gateway = optional(string)
    sdwan_zone = optional(list(object({
      name = optional(string)
    })), [])
    dstaddr               = optional(string)
    sdwan                 = optional(string)
    virtual_wan_link      = optional(string)
    link_monitor_exempt   = optional(string)
    vrf                   = optional(string)
    bfd                   = optional(string)
    tag                   = optional(string)
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.status == null || contains(["enable", "disable"], o.status)]))
    error_message = "Parameter `status` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.devindex == null || (o.devindex >= 0 && o.devindex <= 4294967295)]))
    error_message = "Parameter `devindex` must be in the range 0-4294967295."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.distance == null || (o.distance >= 1 && o.distance <= 255)]))
    error_message = "Parameter `distance` must be in the range 1-255."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.weight == null || (o.weight >= 0 && o.weight <= 255)]))
    error_message = "Parameter `weight` must be in the range 0-255."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.priority == null || (o.priority >= 1 && o.priority <= 65535)]))
    error_message = "Parameter `priority` must be in the range 1-65535."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.blackhole == null || contains(["enable", "disable"], o.blackhole)]))
    error_message = "Parameter `blackhole` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.dynamic_gateway == null || contains(["enable", "disable"], o.dynamic_gateway)]))
    error_message = "Parameter `dynamic_gateway` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.sdwan == null || contains(["enable", "disable"], o.sdwan)]))
    error_message = "Parameter `sdwan` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.virtual_wan_link == null || contains(["enable", "disable"], o.virtual_wan_link)]))
    error_message = "Parameter `virtual_wan_link` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.link_monitor_exempt == null || contains(["enable", "disable"], o.link_monitor_exempt)]))
    error_message = "Parameter `link_monitor_exempt` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.bfd == null || contains(["enable", "disable"], o.bfd)]))
    error_message = "Parameter `bfd` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.static_route6 : o.dynamic_sort_subtable == null || contains(["", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of ``, `true`, `natural`, `alphabetical`."
  }
}

variable "static_route" {
  description = "Static Router configuration"
  default     = []

  type = list(object({
    seq_num                     = optional(number)
    status                      = optional(string)
    dst                         = optional(string)
    src                         = optional(string)
    gateway                     = optional(string)
    preferred_source            = optional(string)
    distance                    = optional(number)
    weight                      = optional(number)
    priority                    = optional(number)
    device                      = optional(string)
    comment                     = optional(string)
    blackhole                   = optional(string)
    dynamic_gateway             = optional(string)
    sdwan_zone                  = optional(string)
    sdwan                       = optional(string)
    virtual_wan_link            = optional(string)
    dstaddr                     = optional(string)
    internet_service            = optional(string)
    internet_service_custom     = optional(string)
    internet_service_fortiguard = optional(string)
    link_monitor_exempt         = optional(string)
    tag                         = optional(string)
    vrf                         = optional(number)
    bfd                         = optional(string)
    dynamic_sort_subtable       = optional(string)
    get_all_tables              = optional(bool)
    vdomparam                   = optional(string)
    update_if_exist             = optional(bool)
  }))
}
