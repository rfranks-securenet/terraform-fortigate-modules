/**
 * # Fortigate Policy Objects configuration module
 *
 * This terraform module configures Policy Objects on a firewall
 */

resource "fortios_firewall_address" "address" {
  for_each = { for address in var.address : address.name => address }

  name                    = each.value.name
  uuid                    = each.value.uuid
  subnet                  = each.value.subnet
  type                    = each.value.type
  route_tag               = each.value.route_tag
  sub_type                = each.value.sub_type
  clearpass_spt           = each.value.clearpass_spt
  start_mac               = each.value.start_mac
  end_mac                 = each.value.end_mac
  start_ip                = each.value.start_ip
  end_ip                  = each.value.end_ip
  fqdn                    = each.value.fqdn
  country                 = each.value.country
  wildcard_fqdn           = each.value.wildcard_fqdn
  cache_ttl               = each.value.cache_ttl
  wildcard                = each.value.wildcard
  sdn                     = each.value.sdn
  interface               = each.value.interface
  tenant                  = each.value.tenant
  organization            = each.value.organization
  epg_name                = each.value.epg_name
  subnet_name             = each.value.subnet_name
  sdn_tag                 = each.value.sdn_tag
  policy_group            = each.value.policy_group
  obj_tag                 = each.value.obj_tag
  obj_type                = each.value.obj_type
  tag_detection_level     = each.value.tag_detection_level
  tag_type                = each.value.tag_type
  hw_vendor               = each.value.hw_vendor
  hw_version              = each.value.hw_version
  hw_model                = each.value.hw_model
  os                      = each.value.os
  sw_version              = each.value.sw_version
  agent_id                = each.value.agent_id
  comment                 = each.value.comment
  visibility              = each.value.visibility
  associated_interface    = each.value.associated_interface
  display_with            = each.value.display_with
  color                   = each.value.color
  filter                  = each.value.filter
  sdn_addr_type           = each.value.sdn_addr_type
  node_ip_only            = each.value.node_ip_only
  obj_id                  = each.value.obj_id
  allow_routing           = each.value.allow_routing
  managed_subnetwork_size = each.value.managed_subnetwork_size
  ipam_allocate_unique    = each.value.ipam_allocate_unique
  passive_fqdn_learning   = each.value.passive_fqdn_learning
  fabric_object           = each.value.fabric_object
  fabric_force_sync       = each.value.fabric_force_sync
  fabric_object_source    = each.value.fabric_object_source
  dynamic_sort_subtable   = each.value.dynamic_sort_subtable
  get_all_tables          = each.value.get_all_tables
  vdomparam               = each.value.vdomparam
  update_if_exist         = each.value.update_if_exist

  dynamic "macaddr" {
    for_each = [for o in each.value.macaddr : o]
    content {
      macaddr = macaddr.value
    }
  }

  dynamic "fsso_group" {
    for_each = [for o in each.value.fsso_group : o]
    content {
      name = fsso_group.value
    }
  }

  dynamic "sso_attribute_value" {
    for_each = [for o in each.value.sso_attribute_value : o]
    content {
      name = sso_attribute_value.value
    }
  }

  dynamic "list" {
    for_each = [for o in each.value.list : o]
    content {
      ip = list.value
    }
  }

  dynamic "tagging" {
    for_each = { for o in each.value.tagging : o.name => o }
    content {
      name     = tagging.value.name
      category = tagging.value.category
      dynamic "tags" {
        for_each = [for p in tagging.value.tags : p]
        content {
          name = tags.value
        }
      }
    }
  }
}

resource "fortios_firewall_address6" "address" {
  for_each              = { for address in var.address6 : address.name => address }
  name                  = each.value.name
  uuid                  = each.value.uuid
  type                  = each.value.type
  sub_type              = each.value.sub_type
  route_tag             = each.value.route_tag
  start_mac             = each.value.start_mac
  end_mac               = each.value.end_mac
  sdn                   = each.value.sdn
  ip6                   = each.value.ip6
  wildcard              = each.value.wildcard
  start_ip              = each.value.start_ip
  end_ip                = each.value.end_ip
  fqdn                  = each.value.fqdn
  country               = each.value.country
  cache_ttl             = each.value.cache_ttl
  display_with          = each.value.display_with
  visibility            = each.value.visibility
  color                 = each.value.color
  obj_id                = each.value.obj_id
  comment               = each.value.comment
  template              = each.value.template
  host_type             = each.value.host_type
  host                  = each.value.host
  tenant                = each.value.tenant
  epg_name              = each.value.epg_name
  sdn_tag               = each.value.sdn_tag
  filter                = each.value.filter
  sdn_addr_type         = each.value.sdn_addr_type
  obj_tag               = each.value.obj_tag
  tag_detection_level   = each.value.tag_detection_level
  tag_type              = each.value.tag_type
  passive_fqdn_learning = each.value.passive_fqdn_learning
  fabric_object         = each.value.fabric_object
  fabric_force_sync     = each.value.fabric_force_sync
  fabric_object_source  = each.value.fabric_object_source
  dynamic_sort_subtable = each.value.dynamic_sort_subtable
  get_all_tables        = each.value.get_all_tables
  vdomparam             = each.value.vdomparam
  update_if_exist       = each.value.update_if_exist

  dynamic "macaddr" {
    for_each = [for o in each.value.macaddr : o]
    content {
      macaddr = macaddr.value
    }
  }

  dynamic "custom_tags" {
    for_each = [for o in each.value.custom_tags : o]
    content {
      name = custom_tags.value
    }
  }

  dynamic "list" {
    for_each = [for o in each.value.list : o]
    content {
      ip = list.value
    }
  }

  dynamic "tagging" {
    for_each = { for o in each.value.tagging : o.name => o }
    content {
      name     = tagging.value.name
      category = tagging.value.category
      dynamic "tags" {
        for_each = [for p in tagging.value.tags : p]
        content {
          name = tags.value
        }
      }
    }
  }

  dynamic "subnet_segment" {
    for_each = { for o in each.value.subnet_segment : o.name => o }
    content {
      name  = subnet_segment.value.name
      type  = subnet_segment.value.type
      value = subnet_segment.value.value
    }
  }
}

resource "fortios_firewall_addrgrp" "group" {
  for_each   = { for group in var.addgrp : group.name => group }
  depends_on = [fortios_firewall_address.address]

  name                  = each.value.name
  type                  = each.value.type
  category              = each.value.category
  uuid                  = each.value.uuid
  comment               = each.value.comment
  exclude               = each.value.exclude
  visibility            = each.value.visibility
  color                 = each.value.color
  display_with          = each.value.display_with
  allow_routing         = each.value.allow_routing
  fabric_object         = each.value.fabric_object
  fabric_force_sync     = each.value.fabric_force_sync
  fabric_object_source  = each.value.fabric_object_source
  dynamic_sort_subtable = each.value.dynamic_sort_subtable
  get_all_tables        = each.value.get_all_tables
  vdomparam             = each.value.vdomparam
  update_if_exist       = each.value.update_if_exist

  dynamic "member" {
    for_each = [for o in each.value.member : o]
    content {
      name = member.value
    }
  }

  dynamic "exclude_member" {
    for_each = [for o in each.value.exclude_member : o]
    content {
      name = exclude_member.value
    }
  }

  dynamic "tagging" {
    for_each = [for o in each.value.tagging : o]
    content {
      name     = tagging.value.name
      category = tagging.value.category
      dynamic "tags" {
        for_each = [for p in tagging.value.tags : p]
        content {
          name = tag.value
        }
      }
    }
  }
}

resource "fortios_firewall_addrgrp6" "group" {
  for_each   = { for group in var.addgrp6 : group.name => group }
  depends_on = [fortios_firewall_address6.address]

  name                  = each.value.name
  type                  = each.value.type
  category              = each.value.category
  uuid                  = each.value.uuid
  visibility            = each.value.visibility
  color                 = each.value.color
  comment               = each.value.comment
  exclude               = each.value.exclude
  display_with          = each.value.display_with
  fabric_object         = each.value.fabric_object
  fabric_force_sync     = each.value.fabric_force_sync
  fabric_object_source  = each.value.fabric_object_source
  dynamic_sort_subtable = each.value.dynamic_sort_subtable
  get_all_tables        = each.value.get_all_tables
  vdomparam             = each.value.vdomparam
  update_if_exist       = each.value.update_if_exist

  dynamic "member" {
    for_each = [for o in each.value.member : o]
    content {
      name = member.value
    }
  }

  dynamic "exclude_member" {
    for_each = [for o in each.value.exclude_member : o]
    content {
      name = exclude_member.value
    }
  }

  dynamic "tagging" {
    for_each = [for o in each.value.tagging : o]
    content {
      name     = tagging.value.name
      category = tagging.value.category
      dynamic "tags" {
        for_each = [for p in tagging.value.tags : p]
        content {
          name = tag.value
        }
      }
    }
  }
}

resource "fortios_firewallservice_category" "categories" {
  for_each             = { for category in var.service_category : category.name => category }
  name                 = each.value.name
  uuid                 = each.value.uuid
  comment              = each.value.comment
  fabric_object        = each.value.fabric_object
  fabric_force_sync    = each.value.fabric_force_sync
  fabric_object_source = each.value.fabric_object_source
  vdomparam            = each.value.vdomparam
  update_if_exist      = each.value.update_if_exist
}

resource "fortios_firewallservice_custom" "services" {
  for_each              = { for service in var.custom_service : service.name => service }
  depends_on            = [fortios_firewallservice_category.categories]
  name                  = each.value.name
  uuid                  = each.value.uuid
  proxy                 = each.value.proxy
  category              = each.value.category
  protocol              = each.value.protocol
  helper                = each.value.helper
  iprange               = each.value.iprange
  fqdn                  = each.value.fqdn
  protocol_number       = each.value.protocol_number
  icmptype              = each.value.icmptype
  icmpcode              = each.value.icmpcode
  tcp_portrange         = each.value.tcp_portrange
  udp_portrange         = each.value.udp_portrange
  udplite_portrange     = each.value.udplite_portrange
  sctp_portrange        = each.value.sctp_portrange
  tcp_halfclose_timer   = each.value.tcp_halfclose_timer
  tcp_halfopen_timer    = each.value.tcp_halfopen_timer
  tcp_timewait_timer    = each.value.tcp_timewait_timer
  tcp_rst_timer         = each.value.tcp_rst_timer
  udp_idle_timer        = each.value.udp_idle_timer
  session_ttl           = each.value.session_ttl
  check_reset_range     = each.value.check_reset_range
  comment               = each.value.comment
  color                 = each.value.color
  visibility            = each.value.visibility
  app_service_type      = each.value.app_service_type
  fabric_object         = each.value.fabric_object
  fabric_force_sync     = each.value.fabric_force_sync
  fabric_object_source  = each.value.fabric_object_source
  dynamic_sort_subtable = each.value.dynamic_sort_subtable
  get_all_tables        = each.value.get_all_tables
  vdomparam             = each.value.vdomparam
  update_if_exist       = each.value.update_if_exist

  dynamic "app_category" {
    for_each = [for o in each.value.app_category : o]
    content {
      id = app_category.value
    }
  }

  dynamic "application" {
    for_each = [for o in each.value.application : o]
    content {
      id = application.value
    }
  }
}
