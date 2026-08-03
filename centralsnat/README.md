<!-- BEGIN_TF_DOCS -->
# Fortigate Central SNAT configuration module

This terraform module configures Central SNAT rules on a Fortigate Firewall

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
| [fortios_firewall_centralsnatmap.snats](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/firewall_centralsnatmap) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_centralsnatmap"></a> [centralsnatmap](#input\_centralsnatmap) | Central SNATs to create | <pre>list(object({<br/>    policyid              = optional(number)<br/>    uuid                  = optional(string)<br/>    status                = optional(string)<br/>    type                  = optional(string)<br/>    orig_addr             = optional(list(string), [])<br/>    orig_addr6            = optional(list(string), [])<br/>    srcintf               = list(string)<br/>    dst_addr              = optional(list(string), [])<br/>    dst_addr6             = optional(list(string), [])<br/>    dstintf               = list(string)<br/>    custom_tags           = optional(list(string), [])<br/>    nat_ippool            = optional(list(string), [])<br/>    nat_ippool6           = optional(list(string), [])<br/>    port_preserve         = optional(string)<br/>    port_random           = optional(string)<br/>    protocol              = number<br/>    orig_port             = number<br/>    nat_port              = optional(number)<br/>    dst_port              = optional(number)<br/>    nat                   = string<br/>    nat46                 = optional(string)<br/>    nat64                 = optional(string)<br/>    comments              = optional(string)<br/>    dynamic_sort_subtable = optional(string, "natural")<br/>    get_all_tables        = optional(bool, false)<br/>    vdomparam             = optional(string)<br/>    update_if_exist       = optional(bool)<br/>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
