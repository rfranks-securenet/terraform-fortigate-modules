/**
 * # Fortigate Central SNAT configuration module
 *
 * This terraform module configures Central SNAT rules on a Fortigate Firewall
 */
terraform {
  required_version = ">= 1.11.0"
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = ">= 1.22.0"
    }
  }
}

resource "fortios_firewall_centralsnatmap" "snats" {
  for_each              = { for snat in var.centralsnatmap : snat.name => snat }
  policyid              = each.value.policyid
  uuid                  = each.value.uuid
  status                = each.value.status
  type                  = each.value.type
  port_preserve         = each.value.port_preserve
  port_random           = each.value.port_random
  protocol              = each.value.protocol
  orig_port             = each.value.orig_port
  nat_port              = each.value.nat_port
  dst_port              = each.value.dst_port
  nat                   = each.value.nat
  nat46                 = each.value.nat46
  nat64                 = each.value.nat64
  comments              = each.value.comments
  dynamic_sort_subtable = each.value.dynamic_sort_subtable
  get_all_tables        = each.value.get_all_tables
  vdomparam             = each.value.vdomparam
  update_if_exist       = each.value.update_if_exist

  dynamic "orig_addr" {
    for_each = [for o in each.value.orig_addr : o]
    content {
      name = orig_addr.value
    }
  }
  dynamic "orig_addr6" {
    for_each = [for o in each.value.orig_addr6 : o]
    content {
      name = orig_addr6.value
    }
  }
  dynamic "srcintf" {
    for_each = [for o in each.value.srcintf : o]
    content {
      name = srcintf.value
    }
  }
  dynamic "dst_addr" {
    for_each = [for o in each.value.dst_addr : o]
    content {
      name = dst_addr.value
    }
  }
  dynamic "dst_addr6" {
    for_each = [for o in each.value.dst_addr6 : o]
    content {
      name = dst_addr6.value
    }
  }
  dynamic "dstintf" {
    for_each = [for o in each.value.dstintf : o]
    content {
      name = dstintf.value
    }
  }
  dynamic "custom_tags" {
    for_each = [for o in each.value.custom_tags : o]
    content {
      name = custom_tags.value
    }
  }
  dynamic "nat_ippool" {
    for_each = [for o in each.value.nat_ippool : o]
    content {
      name = nat_ippool.value
    }
  }
  dynamic "nat_ippool6" {
    for_each = [for o in each.value.nat_ippool6 : o]
    content {
      name = nat_ippool6.value
    }
  }
}
