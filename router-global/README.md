<!-- BEGIN_TF_DOCS -->
# Fortigate global router configuration module

This terraform module configures global router objects such as prefix lists,
route maps, etc.

## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.0 |
| <a name="requirement_fortios"></a> [fortios](#requirement\_fortios) | >= 1.22.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_fortios"></a> [fortios](#provider\_fortios) | >= 1.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [fortios_router_prefixlist.prefixlist](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/router_prefixlist) | resource |
| [fortios_router_prefixlist6.prefixlist6](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/router_prefixlist6) | resource |
| [fortios_router_routemap.routemap](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/router_routemap) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_prefixlist"></a> [prefixlist](#input\_prefixlist) | IPv4 Routing prefix list | <pre>list(object({<br/>    name     = string<br/>    comments = optional(string)<br/>    rule = optional(list(object({<br/>      id     = optional(number)<br/>      action = optional(string)<br/>      prefix = optional(string)<br/>      ge     = optional(number)<br/>      le     = optional(number)<br/>      flags  = optional(string)<br/>    })), [])<br/>    dynamic_sort_subtable = optional(string, "natural")<br/>    get_all_tables        = optional(bool, false)<br/>    vdomparam             = optional(string)<br/>    update_if_exist       = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_prefixlist6"></a> [prefixlist6](#input\_prefixlist6) | IPv6 Routing prefix list | <pre>list(object({<br/>    name     = string<br/>    comments = optional(string)<br/>    rule = optional(list(object({<br/>      id      = optional(number)<br/>      action  = optional(string)<br/>      prefix6 = optional(string)<br/>      ge      = optional(number)<br/>      le      = optional(number)<br/>      flags   = optional(string)<br/>    })), [])<br/>    dynamic_sort_subtable = optional(string, "natural")<br/>    get_all_tables        = optional(bool, false)<br/>    vdomparam             = optional(string)<br/>    update_if_exist       = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_routemap"></a> [routemap](#input\_routemap) | Route Map | <pre>list(object({<br/>    name     = string<br/>    comments = optional(string)<br/>    rule = optional(list(object({<br/>      id                                     = optional(number)<br/>      action                                 = optional(string)<br/>      match_as_path                          = optional(string)<br/>      match_community                        = optional(string)<br/>      match_extcommunity                     = optional(string)<br/>      match_community_exact                  = optional(string)<br/>      match_extcommunity_exact               = optional(string)<br/>      match_origin                           = optional(string)<br/>      match_interface                        = optional(string)<br/>      match_ip_address                       = optional(string)<br/>      match_ip6_address                      = optional(string)<br/>      match_ip_nexthop                       = optional(string)<br/>      match_ip6_nexthop                      = optional(string)<br/>      match_metric                           = optional(string)<br/>      match_route_type                       = optional(string)<br/>      match_tag                              = optional(string)<br/>      match_vrf                              = optional(string)<br/>      match_suppress                         = optional(string)<br/>      set_aggregator_as                      = optional(string)<br/>      set_aggregator_ip                      = optional(string)<br/>      set_aspath_action                      = optional(string)<br/>      set_aspath                             = optional(list(string), [])<br/>      set_atomic_aggregate                   = optional(string)<br/>      set_community_delete                   = optional(string)<br/>      set_community                          = optional(list(string), [])<br/>      set_community_additive                 = optional(string)<br/>      set_dampening_reachability_half_life   = optional(number)<br/>      set_dampening_reuse                    = optional(number)<br/>      set_dampening_suppress                 = optional(number)<br/>      set_dampening_max_suppress             = optional(number)<br/>      set_dampening_unreachability_half_life = optional(number)<br/>      set_extcommunity_rt                    = optional(list(string), [])<br/>      set_extcommunity_soo                   = optional(list(string), [])<br/>      set_ip_nexthop                         = optional(string)<br/>      set_ip_prefsrc                         = optional(string)<br/>      set_vpnv4_nexthop                      = optional(string)<br/>      set_ip6_nexthop                        = optional(string)<br/>      set_ip6_nexthop_local                  = optional(string)<br/>      set_vpnv6_nexthop                      = optional(string)<br/>      set_vpnv6_nexthop_local                = optional(string)<br/>      set_local_preference                   = optional(string)<br/>      set_metric                             = optional(string)<br/>      set_metric_type                        = optional(string)<br/>      set_originator_id                      = optional(string)<br/>      set_origin                             = optional(string)<br/>      set_tag                                = optional(string)<br/>      set_weight                             = optional(number)<br/>      set_flags                              = optional(number)<br/>      match_flags                            = optional(number)<br/>      set_route_tag                          = optional(string)<br/>      set_priority                           = optional(string)<br/>    })), [])<br/>    dynamic_sort_subtable = optional(string, "natural")<br/>    get_all_tables        = optional(bool, false)<br/>    vdomparam             = optional(string)<br/>    update_if_exist       = optional(bool)<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_prefixlist"></a> [prefixlist](#output\_prefixlist) | n/a |
| <a name="output_prefixlist6"></a> [prefixlist6](#output\_prefixlist6) | n/a |
| <a name="output_routemap"></a> [routemap](#output\_routemap) | n/a |
<!-- END_TF_DOCS -->
