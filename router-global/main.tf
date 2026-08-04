/**
 * # Fortigate global router configuration module
 *
 * This terraform module configures global router objects such as prefix lists,
 * route maps, etc.
 */

resource "fortios_router_prefixlist6" "prefixlist6" {
  for_each              = { for prefix_list in var.prefixlist6 : prefix_list.name => prefix_list }
  name                  = each.value.name
  comments              = each.value.comments
  dynamic_sort_subtable = each.value.dynamic_sort_subtable
  get_all_tables        = each.value.get_all_tables
  vdomparam             = each.value.vdomparam
  update_if_exist       = each.value.update_if_exist

  dynamic "rule" {
    for_each = [for o in each.value.rule : o]
    content {
      id      = rule.value.id
      action  = rule.value.action
      prefix6 = rule.value.prefix6
      ge      = rule.value.ge
      le      = rule.value.le
      flags   = rule.value.flags
    }
  }
}
resource "fortios_router_prefixlist" "prefixlist" {
  for_each              = { for prefix_list in var.prefixlist : prefix_list.name => prefix_list }
  name                  = each.value.name
  comments              = each.value.comments
  dynamic_sort_subtable = each.value.dynamic_sort_subtable
  get_all_tables        = each.value.get_all_tables
  vdomparam             = each.value.vdomparam
  update_if_exist       = each.value.update_if_exist

  dynamic "rule" {
    for_each = [for o in each.value.rule : o]
    content {
      id     = rule.value.id
      action = rule.value.action
      prefix = rule.value.prefix
      ge     = rule.value.ge
      le     = rule.value.le
      flags  = rule.value.flags
    }
  }
}

resource "fortios_router_routemap" "routemap" {
  depends_on = [
    fortios_router_prefixlist.prefixlist,
    fortios_router_prefixlist6.prefixlist6,
  ]
  for_each              = { for route_map in var.routemap : route_map.name => route_map }
  name                  = each.value.name
  comments              = each.value.comments
  dynamic_sort_subtable = each.value.dynamic_sort_subtable
  get_all_tables        = each.value.get_all_tables
  vdomparam             = each.value.vdomparam
  update_if_exist       = each.value.update_if_exist

  dynamic "rule" {
    for_each = [for o in each.value.rule : o]
    content {
      id                                     = rule.value.id
      action                                 = rule.value.action
      match_as_path                          = rule.value.match_as_path
      match_community                        = rule.value.match_community
      match_extcommunity                     = rule.value.match_extcommunity
      match_community_exact                  = rule.value.match_community_exact
      match_extcommunity_exact               = rule.value.match_extcommunity_exact
      match_origin                           = rule.value.match_origin
      match_interface                        = rule.value.match_interface
      match_ip_address                       = rule.value.match_ip_address
      match_ip6_address                      = rule.value.match_ip6_address
      match_ip_nexthop                       = rule.value.match_ip_nexthop
      match_ip6_nexthop                      = rule.value.match_ip6_nexthop
      match_metric                           = rule.value.match_metric
      match_route_type                       = rule.value.match_route_type
      match_tag                              = rule.value.match_tag
      match_vrf                              = rule.value.match_vrf
      match_suppress                         = rule.value.match_suppress
      set_aggregator_as                      = rule.value.set_aggregator_as
      set_aggregator_ip                      = rule.value.set_aggregator_ip
      set_aspath_action                      = rule.value.set_aspath_action
      set_atomic_aggregate                   = rule.value.set_atomic_aggregate
      set_community_delete                   = rule.value.set_community_delete
      set_community_additive                 = rule.value.set_community_additive
      set_dampening_reachability_half_life   = rule.value.set_dampening_reachability_half_life
      set_dampening_reuse                    = rule.value.set_dampening_reuse
      set_dampening_suppress                 = rule.value.set_dampening_suppress
      set_dampening_max_suppress             = rule.value.set_dampening_max_suppress
      set_dampening_unreachability_half_life = rule.value.set_dampening_unreachability_half_life
      set_ip_nexthop                         = rule.value.set_ip_nexthop
      set_ip_prefsrc                         = rule.value.set_ip_prefsrc
      set_vpnv4_nexthop                      = rule.value.set_vpnv4_nexthop
      set_ip6_nexthop                        = rule.value.set_ip6_nexthop
      set_ip6_nexthop_local                  = rule.value.set_ip6_nexthop_local
      set_vpnv6_nexthop                      = rule.value.set_vpnv6_nexthop
      set_vpnv6_nexthop_local                = rule.value.set_vpnv6_nexthop_local
      set_local_preference                   = rule.value.set_local_preference
      set_metric                             = rule.value.set_metric
      set_metric_type                        = rule.value.set_metric_type
      set_originator_id                      = rule.value.set_originator_id
      set_origin                             = rule.value.set_origin
      set_tag                                = rule.value.set_tag
      set_weight                             = rule.value.set_weight
      set_flags                              = rule.value.set_flags
      match_flags                            = rule.value.match_flags
      set_route_tag                          = rule.value.set_route_tag
      set_priority                           = rule.value.set_priority

      dynamic "set_aspath" {
        for_each = [for p in rule.value.set_aspath : p]
        content {
          as = set_aspath.value
        }
      }

      dynamic "set_community" {
        for_each = [for p in rule.value.set_community : p]
        content {
          community = set_community.value
        }
      }

      dynamic "set_extcommunity_rt" {
        for_each = [for p in rule.value.set_extcommunity_rt : p]
        content {
          community = set_extcommunity_rt.value
        }
      }

      dynamic "set_extcommunity_soo" {
        for_each = [for p in rule.value.set_extcommunity_soo : p]
        content {
          community = set_extcommunity_soo.value
        }
      }
    }
  }
}
