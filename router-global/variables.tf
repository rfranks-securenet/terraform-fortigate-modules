variable "routemap" {
  description = "Route Map"
  default     = []

  type = list(object({
    name     = string
    comments = optional(string)
    rule = optional(list(object({
      id                                     = optional(number)
      action                                 = optional(string)
      match_as_path                          = optional(string)
      match_community                        = optional(string)
      match_extcommunity                     = optional(string)
      match_community_exact                  = optional(string)
      match_extcommunity_exact               = optional(string)
      match_origin                           = optional(string)
      match_interface                        = optional(string)
      match_ip_address                       = optional(string)
      match_ip6_address                      = optional(string)
      match_ip_nexthop                       = optional(string)
      match_ip6_nexthop                      = optional(string)
      match_metric                           = optional(string)
      match_route_type                       = optional(string)
      match_tag                              = optional(string)
      match_vrf                              = optional(string)
      match_suppress                         = optional(string)
      set_aggregator_as                      = optional(string)
      set_aggregator_ip                      = optional(string)
      set_aspath_action                      = optional(string)
      set_aspath                             = optional(list(string), [])
      set_atomic_aggregate                   = optional(string)
      set_community_delete                   = optional(string)
      set_community                          = optional(list(string), [])
      set_community_additive                 = optional(string)
      set_dampening_reachability_half_life   = optional(number)
      set_dampening_reuse                    = optional(number)
      set_dampening_suppress                 = optional(number)
      set_dampening_max_suppress             = optional(number)
      set_dampening_unreachability_half_life = optional(number)
      set_extcommunity_rt                    = optional(list(string), [])
      set_extcommunity_soo                   = optional(list(string), [])
      set_ip_nexthop                         = optional(string)
      set_ip_prefsrc                         = optional(string)
      set_vpnv4_nexthop                      = optional(string)
      set_ip6_nexthop                        = optional(string)
      set_ip6_nexthop_local                  = optional(string)
      set_vpnv6_nexthop                      = optional(string)
      set_vpnv6_nexthop_local                = optional(string)
      set_local_preference                   = optional(string)
      set_metric                             = optional(string)
      set_metric_type                        = optional(string)
      set_originator_id                      = optional(string)
      set_origin                             = optional(string)
      set_tag                                = optional(string)
      set_weight                             = optional(number)
      set_flags                              = optional(number)
      match_flags                            = optional(number)
      set_route_tag                          = optional(string)
      set_priority                           = optional(string)
    })), [])
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool, false)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.action == null || contains(["permit", "deny"], p.action)]]))
    error_message = "Parameter `rule.action` must be one of `permit`, `deny`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.match_community_exact == null || contains(["enable", "disable"], p.match_community_exact)]]))
    error_message = "Parameter `rule.match_community_exact` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.match_extcommunity_exact == null || contains(["enable", "disable"], p.match_extcommunity_exact)]]))
    error_message = "Parameter `rule.match_extcommunity_exact` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.match_origin == null || contains(["none", "egp", "igp", "incomplete"], p.match_origin)]]))
    error_message = "Parameter `rule.match_origin` must be one of `none`, `egp`, `igp`, `incomplete`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.match_suppress == null || contains(["enable", "disable"], p.match_suppress)]]))
    error_message = "Parameter `rule.match_suppress` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_aspath_action == null || contains(["prepend", "replace"], p.set_aspath_action)]]))
    error_message = "Parameter `rule.set_aspath_action` must be one of `prepend`, `replace`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_atomic_aggregate == null || contains(["enable", "disable"], p.set_atomic_aggregate)]]))
    error_message = "Parameter `rule.set_atomic_aggregate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_community_additive == null || contains(["enable", "disable"], p.set_community_additive)]]))
    error_message = "Parameter `rule.set_community_additive` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_dampening_reachability_half_life == null || (p.set_dampening_reachability_half_life >= 0 && p.set_dampening_reachability_half_life <= 45)]]))
    error_message = "Parameter `rule.set_dampening_reachability_half_life` must be in the range 0-45."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_dampening_reuse == null || (p.set_dampening_reuse >= 0 && p.set_dampening_reuse <= 20000)]]))
    error_message = "Parameter `rule.set_dampening_reuse` must be in the range 0-20000."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_dampening_suppress == null || (p.set_dampening_suppress >= 0 && p.set_dampening_suppress <= 20000)]]))
    error_message = "Parameter `rule.set_dampening_suppress` must be in the range 0-20000."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_dampening_max_suppress == null || (p.set_dampening_max_suppress >= 0 && p.set_dampening_max_suppress <= 255)]]))
    error_message = "Parameter `rule.set_dampening_max_suppress` must be in the range 0-255."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_dampening_unreachability_half_life == null || (p.set_dampening_unreachability_half_life >= 0 && p.set_dampening_unreachability_half_life <= 45)]]))
    error_message = "Parameter `rule.set_dampening_unreachability_half_life` must be in the range 0-45."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_origin == null || contains(["none", "egp", "igp", "incomplete"], p.set_origin)]]))
    error_message = "Parameter `rule.set_origin` must be one of `none`, `egp`, `igp`, `incomplete`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.set_flags == null || (p.set_flags >= 0 && p.set_flags <= 65535)]]))
    error_message = "Parameter `rule.set_flags` must be in the range 0-65535."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : [for p in o.rule : p == null || p.match_flags == null || (p.match_flags >= 0 && p.match_flags <= 65535)]]))
    error_message = "Parameter `rule.match_flags` must be in the range 0-65535."
  }
  validation {
    condition     = alltrue(flatten([for o in var.routemap : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}

variable "prefixlist6" {
  description = "IPv6 Routing prefix list"
  default     = []

  type = list(object({
    name     = string
    comments = optional(string)
    rule = optional(list(object({
      id      = optional(number)
      action  = optional(string)
      prefix6 = optional(string)
      ge      = optional(number)
      le      = optional(number)
      flags   = optional(string)
    })), [])
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool, false)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.prefixlist6 : [for p in o.rule : p == null || p.action == null || contains(["permit", "deny"], p.action)]]))
    error_message = "Parameter `rule.action` must be one of `permit`, `deny`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.prefixlist6 : [for p in o.rule : p == null || p.ge == null || (p.ge >= 0 && p.ge <= 128)]]))
    error_message = "Parameter `rule.ge` must be in the range 0-128."
  }
  validation {
    condition     = alltrue(flatten([for o in var.prefixlist6 : [for p in o.rule : p == null || p.le == null || (p.le >= 0 && p.le <= 128)]]))
    error_message = "Parameter `rule.le` must be in the range 0-128."
  }
  validation {
    condition     = alltrue(flatten([for o in var.prefixlist6 : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}

variable "prefixlist" {
  description = "IPv4 Routing prefix list"
  default     = []

  type = list(object({
    name     = string
    comments = optional(string)
    rule = optional(list(object({
      id     = optional(number)
      action = optional(string)
      prefix = optional(string)
      ge     = optional(number)
      le     = optional(number)
      flags  = optional(string)
    })), [])
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool, false)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.prefixlist : [for p in o.rule : p == null || p.action == null || contains(["permit", "deny"], p.action)]]))
    error_message = "Parameter `rule.action` must be one of `permit`, `deny`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.prefixlist : [for p in o.rule : p == null || p.ge == null || (p.ge >= 0 && p.ge <= 32)]]))
    error_message = "Parameter `rule.ge` must be in the range 0-32."
  }
  validation {
    condition     = alltrue(flatten([for o in var.prefixlist : [for p in o.rule : p == null || p.le == null || (p.le >= 0 && p.le <= 32)]]))
    error_message = "Parameter `rule.le` must be in the range 0-32."
  }
  validation {
    condition     = alltrue(flatten([for o in var.prefixlist : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}
