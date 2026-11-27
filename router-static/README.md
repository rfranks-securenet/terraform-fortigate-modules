<!-- BEGIN_TF_DOCS -->
# Fortigate Static Route configuration module

This terraform module configures static routes on a firewall

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
| [fortios_router_static.static_route](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/router_static) | resource |
| [fortios_router_static6.static_route](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/router_static6) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_static_route"></a> [static\_route](#input\_static\_route) | Static Router configuration | <pre>list(object({<br/>    seq_num                     = optional(number)<br/>    status                      = optional(string)<br/>    dst                         = optional(string)<br/>    src                         = optional(string)<br/>    gateway                     = optional(string)<br/>    preferred_source            = optional(string)<br/>    distance                    = optional(number)<br/>    weight                      = optional(number)<br/>    priority                    = optional(number)<br/>    device                      = optional(string)<br/>    comment                     = optional(string)<br/>    blackhole                   = optional(string)<br/>    dynamic_gateway             = optional(string)<br/>    sdwan_zone                  = optional(string)<br/>    sdwan                       = optional(string)<br/>    virtual_wan_link            = optional(string)<br/>    dstaddr                     = optional(string)<br/>    internet_service            = optional(string)<br/>    internet_service_custom     = optional(string)<br/>    internet_service_fortiguard = optional(string)<br/>    link_monitor_exempt         = optional(string)<br/>    tag                         = optional(string)<br/>    vrf                         = optional(number)<br/>    bfd                         = optional(string)<br/>    dynamic_sort_subtable       = optional(string)<br/>    get_all_tables              = optional(bool)<br/>    vdomparam                   = optional(string)<br/>    update_if_exist             = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_static_route6"></a> [static\_route6](#input\_static\_route6) | Static Router configuration | <pre>list(object({<br/>    seq_num         = optional(string)<br/>    status          = optional(string)<br/>    dst             = optional(string)<br/>    gateway         = optional(string)<br/>    device          = string<br/>    devindex        = optional(string)<br/>    distance        = optional(string)<br/>    weight          = optional(string)<br/>    priority        = optional(string)<br/>    comment         = optional(string)<br/>    blackhole       = optional(string)<br/>    dynamic_gateway = optional(string)<br/>    sdwan_zone = optional(list(object({<br/>      name = optional(string)<br/>    })), [])<br/>    dstaddr               = optional(string)<br/>    sdwan                 = optional(string)<br/>    virtual_wan_link      = optional(string)<br/>    link_monitor_exempt   = optional(string)<br/>    vrf                   = optional(string)<br/>    bfd                   = optional(string)<br/>    tag                   = optional(string)<br/>    dynamic_sort_subtable = optional(string, "natural")<br/>    get_all_tables        = optional(bool)<br/>    vdomparam             = optional(string)<br/>    update_if_exist       = optional(bool)<br/>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
