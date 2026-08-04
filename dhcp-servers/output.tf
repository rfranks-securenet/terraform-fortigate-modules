output "dhcp_server" {
  value     = fortios_systemdhcp_server.dhcp
  sensitive = true
}

output "dhcp6_server" {
  value     = fortios_systemdhcp6_server.dhcp
  sensitive = true
}
