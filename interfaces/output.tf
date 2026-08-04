output "interface" {
  value = fortios_system_interface.interfaces
  sensitive = true
}

output "zone" {
  value = fortios_system_zone.zones
}
