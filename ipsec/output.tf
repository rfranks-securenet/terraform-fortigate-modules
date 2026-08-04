output "phase1interface" {
  value     = fortios_vpnipsec_phase1interface.phase1
  sensitive = true
}

output "phase2interface" {
  value     = fortios_vpnipsec_phase2interface.phase2
  sensitive = true
}
