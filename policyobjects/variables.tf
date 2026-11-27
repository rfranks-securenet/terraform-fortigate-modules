variable "addgrp6" {
  description = "IPv6 Address Groups"
  default     = []

  type = list(object({
    name           = string
    type           = optional(string)
    category       = optional(string)
    uuid           = optional(string)
    visibility     = optional(string)
    color          = optional(number)
    comment        = optional(string)
    member         = list(string)
    exclude        = optional(string)
    exclude_member = optional(list(string), [])
    tagging = optional(list(object({
      name     = optional(string)
      category = optional(string)
      tags     = optional(list(string), [])
    })), [])
    display_with          = optional(string)
    custom_tags           = optional(list(string), [])
    fabric_object         = optional(string)
    fabric_force_sync     = optional(string)
    fabric_object_source  = optional(string)
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool, false)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.type == null || contains(["default", "dynamic-tag"], o.type)]))
    error_message = "Parameter `type` must be one of `default`, `dynamic-tag`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.category == null || contains(["default", "ztna-ems-tag"], o.category)]))
    error_message = "Parameter `category` must be one of `default`, `ztna-ems-tag`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.visibility == null || contains(["enable", "disable"], o.visibility)]))
    error_message = "Parameter `visibility` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.color == null || (o.color >= 1 && o.color <= 32)]))
    error_message = "Parameter `color` must be in the range 1-32."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.exclude == null || contains(["enable", "disable"], o.exclude)]))
    error_message = "Parameter `exclude` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.display_with == null || contains(["all-tags", "first-tag-only", "icon-and-color"], o.display_with)]))
    error_message = "Parameter `display_with` must be one of `all-tags`, `first-tag-only`, `icon-and-color`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.fabric_object == null || contains(["enable", "disable"], o.fabric_object)]))
    error_message = "Parameter `fabric_object` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.fabric_force_sync == null || contains(["enable", "disable"], o.fabric_force_sync)]))
    error_message = "Parameter `fabric_force_sync` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.fabric_object_source == null || contains(["member", "local", "root"], o.fabric_object_source)]))
    error_message = "Parameter `fabric_object_source` must be one of `member`, `local`, `root`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp6 : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}

variable "custom_service" {
  description = "Custom Services"
  default     = []

  type = list(object({
    name                  = string
    uuid                  = optional(string)
    proxy                 = optional(string)
    category              = optional(string)
    protocol              = optional(number)
    helper                = optional(string)
    iprange               = optional(string)
    fqdn                  = optional(string)
    protocol_number       = optional(string)
    icmptype              = optional(string)
    icmpcode              = optional(string)
    tcp_portrange         = optional(string)
    udp_portrange         = optional(string)
    udplite_portrange     = optional(string)
    sctp_portrange        = optional(string)
    tcp_halfclose_timer   = optional(number)
    tcp_halfopen_timer    = optional(string)
    tcp_timewait_timer    = optional(string)
    tcp_rst_timer         = optional(string)
    udp_idle_timer        = optional(string)
    session_ttl           = optional(string)
    check_reset_range     = optional(string)
    comment               = optional(string)
    color                 = optional(number)
    visibility            = optional(string)
    app_service_type      = optional(string)
    app_category          = optional(list(string), [])
    application           = optional(list(string), [])
    fabric_object         = optional(string)
    fabric_force_sync     = optional(string)
    fabric_object_source  = optional(string)
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool, false)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.proxy == null || contains(["enable", "disable"], o.proxy)]))
    error_message = "Parameter `proxy` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.tcp_halfclose_timer == null || (o.tcp_halfclose_timer >= 1 && o.tcp_halfclose_timer <= 86400)]))
    error_message = "Parameter `tcp_halfclose_timer` must be in the range 1-86400."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.tcp_halfopen_timer == null || (o.tcp_halfopen_timer >= 1 && o.tcp_halfopen_timer <= 86400)]))
    error_message = "Parameter `tcp_halfopen_timer` must be in the range 1-86400."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.tcp_timewait_timer == null || (o.tcp_timewait_timer >= 1 && o.tcp_timewait_timer <= 300)]))
    error_message = "Parameter `tcp_timewait_timer` must be in the range 1-300."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.tcp_rst_timer == null || (o.tcp_rst_timer >= 5 && o.tcp_rst_timer <= 300)]))
    error_message = "Parameter `tcp_rst_timer` must be in the range 5-300."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.udp_idle_timer == null || (o.udp_idle_timer >= 0 && o.udp_idle_timer <= 86400)]))
    error_message = "Parameter `udp_idle_timer` must be in the range 0-86400."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.session_ttl == null || (o.session_ttl >= 300 && o.session_ttl <= 2764800)]))
    error_message = "Parameter `session_ttl` must be in the range 300-2764800."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.check_reset_range == null || contains(["disable", "strict", "default"], o.check_reset_range)]))
    error_message = "Parameter `check_reset_range` must be one of `disable`, `strict`, `default`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.color == null || (o.color >= 1 && o.color <= 32)]))
    error_message = "Parameter `color` must be in the range 1-32."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.visibility == null || contains(["enable", "disable"], o.visibility)]))
    error_message = "Parameter `visibility` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.app_service_type == null || contains(["disable", "app-id", "app-category"], o.app_service_type)]))
    error_message = "Parameter `app_service_type` must be one of `disable`, `app-id`, `app-category`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.fabric_object == null || contains(["enable", "disable"], o.fabric_object)]))
    error_message = "Parameter `fabric_object` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.fabric_force_sync == null || contains(["enable", "disable"], o.fabric_force_sync)]))
    error_message = "Parameter `fabric_force_sync` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.fabric_object_source == null || contains(["member", "local", "root"], o.fabric_object_source)]))
    error_message = "Parameter `fabric_object_source` must be one of `member`, `local`, `root`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.custom_service : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}

variable "address6" {
  description = "IPv6 address objects to create"
  default     = []

  type = list(object({
    name         = string
    uuid         = optional(string)
    type         = optional(string)
    sub_type     = optional(string)
    route_tag    = optional(string)
    macaddr      = optional(list(string), [])
    start_mac    = optional(string)
    end_mac      = optional(string)
    sdn          = optional(string)
    ip6          = optional(string)
    wildcard     = optional(string)
    start_ip     = optional(string)
    end_ip       = optional(string)
    fqdn         = optional(string)
    country      = optional(string)
    cache_ttl    = optional(number)
    display_with = optional(string)
    custom_tags  = optional(list(string), [])
    visibility   = optional(string)
    color        = optional(number)
    obj_id       = optional(string)
    list         = optional(list(string), [])
    tagging = optional(list(object({
      name     = optional(string)
      category = optional(string)
      tags     = optional(list(string), [])
    })), [])
    comment  = optional(string)
    template = optional(string)
    subnet_segment = optional(list(object({
      name  = optional(string)
      type  = optional(string)
      value = optional(string)
    })), [])
    host_type             = optional(string)
    host                  = optional(string)
    tenant                = optional(string)
    epg_name              = optional(string)
    sdn_tag               = optional(string)
    filter                = optional(string)
    sdn_addr_type         = optional(string)
    obj_tag               = optional(string)
    tag_detection_level   = optional(string)
    tag_type              = optional(string)
    passive_fqdn_learning = optional(string)
    fabric_object         = optional(string)
    fabric_force_sync     = optional(string)
    fabric_object_source  = optional(string)
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool, false)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.type == null || contains(["ipprefix", "iprange", "fqdn", "geography", "dynamic", "template", "mac", "route-tag", "wildcard"], o.type)]))
    error_message = "Parameter `type` must be one of `ipprefix`, `iprange`, `fqdn`, `geography`, `dynamic`, `template`, `mac`, `route-tag`, `wildcard`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.sub_type == null || contains(["sdn", "ems-tag", "8021x"], o.sub_type)]))
    error_message = "Parameter `sub_type` must be one of `sdn`, `ems-tag`, `8021x`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.display_with == null || contains(["all-tags", "first-tag-only", "icon-and-color"], o.display_with)]))
    error_message = "Parameter `display_with` must be one of `all-tags`, `first-tag-only`, `icon-and-color`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.visibility == null || contains(["enable", "disable"], o.visibility)]))
    error_message = "Parameter `visibility` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.color == null || (o.color >= 1 && o.color <= 32)]))
    error_message = "Parameter `color` must be in the range 1-32."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : [for p in o.subnet_segment : p == null || p.type == null || contains(["any", "specific"], p.type)]]))
    error_message = "Parameter `subnet_segment.type` must be one of `any`, `specific`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.host_type == null || contains(["any", "specific"], o.host_type)]))
    error_message = "Parameter `host_type` must be one of `any`, `specific`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.sdn_addr_type == null || contains(["private", "public", "all"], o.sdn_addr_type)]))
    error_message = "Parameter `sdn_addr_type` must be one of `private`, `public`, `all`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.passive_fqdn_learning == null || contains(["disable", "enable"], o.passive_fqdn_learning)]))
    error_message = "Parameter `passive_fqdn_learning` must be one of `disable`, `enable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.fabric_object == null || contains(["enable", "disable"], o.fabric_object)]))
    error_message = "Parameter `fabric_object` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.fabric_force_sync == null || contains(["enable", "disable"], o.fabric_force_sync)]))
    error_message = "Parameter `fabric_force_sync` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.fabric_object_source == null || contains(["member", "local", "root"], o.fabric_object_source)]))
    error_message = "Parameter `fabric_object_source` must be one of `member`, `local`, `root`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address6 : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}

variable "address" {
  description = "IPv4 address objects to create"
  default     = []

  type = list(object({
    name                 = string
    uuid                 = optional(string)
    subnet               = optional(string)
    type                 = optional(string)
    route_tag            = optional(string)
    sub_type             = optional(string)
    clearpass_spt        = optional(string)
    macaddr              = optional(list(string), [])
    start_mac            = optional(string)
    end_mac              = optional(string)
    start_ip             = optional(string)
    end_ip               = optional(string)
    fqdn                 = optional(string)
    country              = optional(string)
    wildcard_fqdn        = optional(string)
    cache_ttl            = optional(number)
    wildcard             = optional(string)
    sdn                  = optional(string)
    fsso_group           = optional(list(string), [])
    sso_attribute_value  = optional(list(string), [])
    interface            = optional(string)
    tenant               = optional(string)
    organization         = optional(string)
    epg_name             = optional(string)
    subnet_name          = optional(string)
    sdn_tag              = optional(string)
    policy_group         = optional(string)
    obj_tag              = optional(string)
    obj_type             = optional(string)
    tag_detection_level  = optional(string)
    tag_type             = optional(string)
    hw_vendor            = optional(string)
    hw_version           = optional(string)
    hw_model             = optional(string)
    os                   = optional(string)
    sw_version           = optional(string)
    agent_id             = optional(string)
    comment              = optional(string)
    visibility           = optional(string)
    associated_interface = optional(string)
    display_with         = optional(string)
    custom_tags          = optional(list(string), [])
    color                = optional(string)
    filter               = optional(string)
    sdn_addr_type        = optional(string)
    node_ip_only         = optional(string)
    obj_id               = optional(string)
    list                 = optional(list(string), [])
    tagging = optional(list(object({
      name     = optional(string)
      category = optional(string)
      tags     = optional(list(string), [])
    })), [])
    allow_routing           = optional(string)
    managed_subnetwork_size = optional(number)
    ipam_allocate_unique    = optional(string)
    passive_fqdn_learning   = optional(string)
    fabric_object           = optional(string)
    fabric_force_sync       = optional(string)
    fabric_object_source    = optional(string)
    dynamic_sort_subtable   = optional(string, "natural")
    get_all_tables          = optional(bool, false)
    vdomparam               = optional(string)
    update_if_exist         = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.address : o.type == null || contains(["ipmask", "iprange", "fqdn", "geography", "wildcard", "dynamic", "interface-subnet", "mac", "route-tag"], o.type)]))
    error_message = "Parameter `type` must be one of `ipmask`, `iprange`, `fqdn`, `geography`, `wildcard`, `dynamic`, `interface-subnet`, `mac`, `route-tag`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.clearpass_spt == null || contains(["unknown", "healthy", "quarantine", "checkup", "transient", "infected"], o.clearpass_spt)]))
    error_message = "Parameter `clearpass_spt` must be one of `unknown`, `healthy`, `quarantine`, `checkup`, `transient`, `infected`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.obj_type == null || contains(["ip", "mac"], o.obj_type)]))
    error_message = "Parameter `obj_type` must be one of `ip`, `mac`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.visibility == null || contains(["enable", "disable"], o.visibility)]))
    error_message = "Parameter `visibility` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.display_with == null || contains(["all-tags", "first-tag-only", "icon-and-color"], o.display_with)]))
    error_message = "Parameter `display_with` must be one of `all-tags`, `first-tag-only`, `icon-and-color`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.sdn_addr_type == null || contains(["private", "public", "all"], o.sdn_addr_type)]))
    error_message = "Parameter `sdn_addr_type` must be one of `private`, `public`, `all`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.node_ip_only == null || contains(["enable", "disable"], o.node_ip_only)]))
    error_message = "Parameter `node_ip_only` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.allow_routing == null || contains(["enable", "disable"], o.allow_routing)]))
    error_message = "Parameter `allow_routing` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.managed_subnetwork_size == null || contains([4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216], o.managed_subnetwork_size)]))
    error_message = "Parameter `managed_subnetwork_size` must be one of `4`, `8`, `16`, `32`, `64`, `128`, `256`, `512`, `1024`, `2048`, `4096`, `8192`, `16384`, `32768`, `65536`, `131072`, `262144`, `524288`, `1048576`, `2097152`, `4194304`, `8388608`, `16777216`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.ipam_allocate_unique == null || contains(["enable", "disable"], o.ipam_allocate_unique)]))
    error_message = "Parameter `ipam_allocate_unique` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.passive_fqdn_learning == null || contains(["disable", "enable"], o.passive_fqdn_learning)]))
    error_message = "Parameter `passive_fqdn_learning` must be one of `disable`, `enable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.fabric_object == null || contains(["enable", "disable"], o.fabric_object)]))
    error_message = "Parameter `fabric_object` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.fabric_force_sync == null || contains(["enable", "disable"], o.fabric_force_sync)]))
    error_message = "Parameter `fabric_force_sync` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.fabric_object_source == null || contains(["member", "local", "root"], o.fabric_object_source)]))
    error_message = "Parameter `fabric_object_source` must be one of `member`, `local`, `root`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.address : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}

variable "addgrp" {
  description = "IPv4 Address Groups"
  default     = []

  type = list(object({
    name           = string
    type           = optional(string)
    category       = optional(string)
    uuid           = optional(string)
    member         = list(string)
    comment        = optional(string)
    exclude        = optional(string)
    exclude_member = optional(list(string), [])
    visibility     = optional(string)
    color          = optional(string)
    tagging = optional(list(object({
      name     = optional(string)
      category = optional(string)
      tags     = optional(list(string), [])
    })), [])
    display_with          = optional(string)
    custom_tags           = optional(list(string), [])
    allow_routing         = optional(string)
    fabric_object         = optional(string)
    fabric_force_sync     = optional(string)
    fabric_object_source  = optional(string)
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool, false)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.addgrp : o.exclude == null || contains(["enable", "disable"], o.exclude)]))
    error_message = "Parameter `exclude` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp : o.visibility == null || contains(["enable", "disable"], o.visibility)]))
    error_message = "Parameter `visibility` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp : o.display_with == null || contains(["all-tags", "first-tag-only", "icon-and-color"], o.display_with)]))
    error_message = "Parameter `display_with` must be one of `all-tags`, `first-tag-only`, `icon-and-color`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp : o.allow_routing == null || contains(["enable", "disable"], o.allow_routing)]))
    error_message = "Parameter `allow_routing` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp : o.fabric_object == null || contains(["enable", "disable"], o.fabric_object)]))
    error_message = "Parameter `fabric_object` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp : o.fabric_force_sync == null || contains(["enable", "disable"], o.fabric_force_sync)]))
    error_message = "Parameter `fabric_force_sync` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp : o.fabric_object_source == null || contains(["member", "local", "root"], o.fabric_object_source)]))
    error_message = "Parameter `fabric_object_source` must be one of `member`, `local`, `root`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.addgrp : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}

variable "service_category" {
  description = "Service categories"
  default     = []

  type = list(object({
    name                 = string
    uuid                 = optional(string)
    comment              = optional(string)
    fabric_object        = optional(string)
    fabric_force_sync    = optional(string)
    fabric_object_source = optional(string)
    vdomparam            = optional(string)
    update_if_exist      = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.service_category : o.fabric_object == null || contains(["enable", "disable"], o.fabric_object)]))
    error_message = "Parameter `fabric_object` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.service_category : o.fabric_force_sync == null || contains(["enable", "disable"], o.fabric_force_sync)]))
    error_message = "Parameter `fabric_force_sync` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.service_category : o.fabric_object_source == null || contains(["member", "local", "root"], o.fabric_object_source)]))
    error_message = "Parameter `fabric_object_source` must be one of `member`, `local`, `root`."
  }
}
