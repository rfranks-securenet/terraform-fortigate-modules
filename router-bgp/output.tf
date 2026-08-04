output "bgp" {
  value = fortios_router_bgp.router_bgp
}

output "neighbor" {
  value = fortios_routerbgp_neighbor.peer
}
