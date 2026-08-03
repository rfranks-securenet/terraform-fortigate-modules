/**
 * # Fortigate Static Route configuration module
 *
 * This terraform module configures static routes on a firewall
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

resource "fortios_router_static" "static_route" {
  for_each                    = { for route in var.static_routes : "${route.dst}_${route.gateway == null ? route.blackhole == "enable" ? "blackhole" : route.device == null ? "" : route.device : route.gateway}" => route }
  seq_num                     = each.value.seq_num
  status                      = each.value.status
  dst                         = each.value.dst
  src                         = each.value.src
  gateway                     = each.value.gateway
  preferred_source            = each.value.preferred_source
  distance                    = each.value.distance
  weight                      = each.value.weight
  priority                    = each.value.priority
  device                      = each.value.device
  comment                     = each.value.comment
  blackhole                   = each.value.blackhole
  dynamic_gateway             = each.value.dynamic_gateway
  sdwan                       = each.value.sdwan
  virtual_wan_link            = each.value.virtual_wan_link
  dstaddr                     = each.value.dstaddr
  internet_service            = each.value.internet_service
  internet_service_custom     = each.value.internet_service_custom
  internet_service_fortiguard = each.value.internet_service_fortiguard
  link_monitor_exempt         = each.value.link_monitor_exempt
  tag                         = each.value.tag
  vrf                         = each.value.vrf
  bfd                         = each.value.bfd
  dynamic_sort_subtable       = each.value.dynamic_sort_subtable
  get_all_tables              = each.value.get_all_tables
  vdomparam                   = each.value.vdomparam
  update_if_exist             = each.value.update_if_exist

  dynamic "sdwan_zone" {
    for_each = each.value.sdwan_zone == null ? [] : [each.value.sdwan_zone]
    content {
      name = sdwan_zone.value
    }
  }
}
