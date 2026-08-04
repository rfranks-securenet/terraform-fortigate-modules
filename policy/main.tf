/**
 * # Fortigate Policy configuration module
 *
 * This terraform module configures Policy on a firewall
 */

resource "fortios_firewall_policy" "policy" {
  for_each                       = { for policy in var.policy : policy.name => policy }
  policyid                       = each.value.policyid
  name                           = each.value.name
  uuid                           = each.value.uuid
  fabric_object                  = each.value.fabric_object
  fabric_force_sync              = each.value.fabric_force_sync
  fabric_object_source           = each.value.fabric_object_source
  ztna_status                    = each.value.ztna_status
  ztna_device_ownership          = each.value.ztna_device_ownership
  ztna_tags_match_logic          = each.value.ztna_tags_match_logic
  internet_service               = each.value.internet_service
  internet_service_src           = each.value.internet_service_src
  reputation_minimum             = each.value.reputation_minimum
  reputation_direction           = each.value.reputation_direction
  internet_service6              = each.value.internet_service6
  internet_service6_src          = each.value.internet_service6_src
  reputation_minimum6            = each.value.reputation_minimum6
  reputation_direction6          = each.value.reputation_direction6
  rtp_nat                        = each.value.rtp_nat
  learning_mode                  = each.value.learning_mode
  action                         = each.value.action
  nat64                          = each.value.nat64
  nat46                          = each.value.nat46
  send_deny_packet               = each.value.send_deny_packet
  firewall_session_dirty         = each.value.firewall_session_dirty
  status                         = each.value.status
  schedule                       = each.value.schedule
  schedule_timeout               = each.value.schedule_timeout
  policy_expiry                  = each.value.policy_expiry
  policy_expiry_date             = each.value.policy_expiry_date
  policy_expiry_date_utc         = each.value.policy_expiry_date_utc
  tos                            = each.value.tos
  tos_mask                       = each.value.tos_mask
  tos_negate                     = each.value.tos_negate
  anti_replay                    = each.value.anti_replay
  tcp_session_without_syn        = each.value.tcp_session_without_syn
  geoip_anycast                  = each.value.geoip_anycast
  geoip_match                    = each.value.geoip_match
  dynamic_shaping                = each.value.dynamic_shaping
  passive_wan_health_measurement = each.value.passive_wan_health_measurement
  app_monitor                    = each.value.app_monitor
  utm_status                     = each.value.utm_status
  inspection_mode                = each.value.inspection_mode
  http_policy_redirect           = each.value.http_policy_redirect
  ssh_policy_redirect            = each.value.ssh_policy_redirect
  ztna_policy_redirect           = each.value.ztna_policy_redirect
  webproxy_profile               = each.value.webproxy_profile
  profile_type                   = each.value.profile_type
  profile_group                  = each.value.profile_group
  av_profile                     = each.value.av_profile
  webfilter_profile              = each.value.webfilter_profile
  dnsfilter_profile              = each.value.dnsfilter_profile
  emailfilter_profile            = each.value.emailfilter_profile
  dlp_profile                    = each.value.dlp_profile
  spamfilter_profile             = each.value.spamfilter_profile
  dlp_sensor                     = each.value.dlp_sensor
  file_filter_profile            = each.value.file_filter_profile
  ips_sensor                     = each.value.ips_sensor
  application_list               = each.value.application_list
  voip_profile                   = each.value.voip_profile
  ips_voip_filter                = each.value.ips_voip_filter
  sctp_filter_profile            = each.value.sctp_filter_profile
  diameter_filter_profile        = each.value.diameter_filter_profile
  virtual_patch_profile          = each.value.virtual_patch_profile
  icap_profile                   = each.value.icap_profile
  cifs_profile                   = each.value.cifs_profile
  videofilter_profile            = each.value.videofilter_profile
  waf_profile                    = each.value.waf_profile
  ssh_filter_profile             = each.value.ssh_filter_profile
  casb_profile                   = each.value.casb_profile
  telemetry_profile              = each.value.telemetry_profile
  llm_profile                    = each.value.llm_profile
  profile_protocol_options       = each.value.profile_protocol_options
  ssl_ssh_profile                = each.value.ssl_ssh_profile
  logtraffic                     = each.value.logtraffic
  logtraffic_start               = each.value.logtraffic_start
  log_http_transaction           = each.value.log_http_transaction
  capture_packet                 = each.value.capture_packet
  auto_asic_offload              = each.value.auto_asic_offload
  np_acceleration                = each.value.np_acceleration
  wanopt                         = each.value.wanopt
  wanopt_detection               = each.value.wanopt_detection
  wanopt_passive_opt             = each.value.wanopt_passive_opt
  wanopt_profile                 = each.value.wanopt_profile
  wanopt_peer                    = each.value.wanopt_peer
  webcache                       = each.value.webcache
  webcache_https                 = each.value.webcache_https
  webproxy_forward_server        = each.value.webproxy_forward_server
  traffic_shaper                 = each.value.traffic_shaper
  traffic_shaper_reverse         = each.value.traffic_shaper_reverse
  per_ip_shaper                  = each.value.per_ip_shaper
  nat                            = each.value.nat
  pcp_outbound                   = each.value.pcp_outbound
  pcp_inbound                    = each.value.pcp_inbound
  permit_any_host                = each.value.permit_any_host
  permit_stun_host               = each.value.permit_stun_host
  fixedport                      = each.value.fixedport
  port_preserve                  = each.value.port_preserve
  port_random                    = each.value.port_random
  ippool                         = each.value.ippool
  session_ttl                    = each.value.session_ttl
  vlan_cos_fwd                   = each.value.vlan_cos_fwd
  vlan_cos_rev                   = each.value.vlan_cos_rev
  inbound                        = each.value.inbound
  outbound                       = each.value.outbound
  natinbound                     = each.value.natinbound
  natoutbound                    = each.value.natoutbound
  fec                            = each.value.fec
  wccp                           = each.value.wccp
  ntlm                           = each.value.ntlm
  ntlm_guest                     = each.value.ntlm_guest
  fsso                           = each.value.fsso
  wsso                           = each.value.wsso
  rsso                           = each.value.rsso
  fsso_agent_for_ntlm            = each.value.fsso_agent_for_ntlm
  scim                           = each.value.scim
  saml_server                    = each.value.saml_server
  auth_path                      = each.value.auth_path
  disclaimer                     = each.value.disclaimer
  email_collect                  = each.value.email_collect
  vpntunnel                      = each.value.vpntunnel
  natip                          = each.value.natip
  match_vip                      = each.value.match_vip
  match_vip_only                 = each.value.match_vip_only
  diffserv_copy                  = each.value.diffserv_copy
  skip_vrf_match                 = each.value.skip_vrf_match
  diffserv_forward               = each.value.diffserv_forward
  diffserv_reverse               = each.value.diffserv_reverse
  diffservcode_forward           = each.value.diffservcode_forward
  diffservcode_rev               = each.value.diffservcode_rev
  tcp_mss_sender                 = each.value.tcp_mss_sender
  tcp_mss_receiver               = each.value.tcp_mss_receiver
  comments                       = each.value.comments
  label                          = each.value.label
  global_label                   = each.value.global_label
  auth_cert                      = each.value.auth_cert
  auth_redirect_addr             = each.value.auth_redirect_addr
  redirect_url                   = each.value.redirect_url
  identity_based_route           = each.value.identity_based_route
  block_notification             = each.value.block_notification
  replacemsg_override_group      = each.value.replacemsg_override_group
  srcaddr_negate                 = each.value.srcaddr_negate
  srcaddr6_negate                = each.value.srcaddr6_negate
  dstaddr_negate                 = each.value.dstaddr_negate
  dstaddr6_negate                = each.value.dstaddr6_negate
  ztna_ems_tag_negate            = each.value.ztna_ems_tag_negate
  service_negate                 = each.value.service_negate
  internet_service_negate        = each.value.internet_service_negate
  internet_service_src_negate    = each.value.internet_service_src_negate
  internet_service6_negate       = each.value.internet_service6_negate
  internet_service6_src_negate   = each.value.internet_service6_src_negate
  timeout_send_rst               = each.value.timeout_send_rst
  captive_portal_exempt          = each.value.captive_portal_exempt
  decrypted_traffic_mirror       = each.value.decrypted_traffic_mirror
  ssl_mirror                     = each.value.ssl_mirror
  scan_botnet_connections        = each.value.scan_botnet_connections
  dsri                           = each.value.dsri
  radius_mac_auth_bypass         = each.value.radius_mac_auth_bypass
  radius_ip_auth_bypass          = each.value.radius_ip_auth_bypass
  delay_tcp_npu_session          = each.value.delay_tcp_npu_session
  vlan_filter                    = each.value.vlan_filter
  sgt_check                      = each.value.sgt_check
  dynamic_sort_subtable          = each.value.dynamic_sort_subtable
  get_all_tables                 = each.value.get_all_tables
  vdomparam                      = each.value.vdomparam
  update_if_exist                = each.value.update_if_exist

  dynamic "srcintf" {
    for_each = [for o in each.value.srcintf : o]
    content {
      name = srcintf.value
    }
  }
  dynamic "dstintf" {
    for_each = [for o in each.value.dstintf : o]
    content {
      name = dstintf.value
    }
  }
  dynamic "srcaddr" {
    for_each = [for o in each.value.srcaddr : o]
    content {
      name = srcaddr.value
    }
  }
  dynamic "dstaddr" {
    for_each = [for o in each.value.dstaddr : o]
    content {
      name = dstaddr.value
    }
  }
  dynamic "srcaddr6" {
    for_each = [for o in each.value.srcaddr6 : o]
    content {
      name = srcaddr6.value
    }
  }
  dynamic "dstaddr6" {
    for_each = [for o in each.value.dstaddr6 : o]
    content {
      name = dstaddr6.value
    }
  }
  dynamic "custom_tags" {
    for_each = [for o in each.value.custom_tags : o]
    content {
      name = custom_tags.value
    }
  }
  dynamic "ztna_ems_tag" {
    for_each = [for o in each.value.ztna_ems_tag : o]
    content {
      name = ztna_ems_tag.value
    }
  }
  dynamic "ztna_ems_tag_secondary" {
    for_each = [for o in each.value.ztna_ems_tag_secondary : o]
    content {
      name = ztna_ems_tag_secondary.value
    }
  }
  dynamic "ztna_ems_tag6" {
    for_each = [for o in each.value.ztna_ems_tag6 : o]
    content {
      name = ztna_ems_tag6.value
    }
  }
  dynamic "ztna_geo_tag" {
    for_each = [for o in each.value.ztna_geo_tag : o]
    content {
      name = ztna_geo_tag.value
    }
  }
  dynamic "ztna_destination" {
    for_each = [for o in each.value.ztna_destination : o]
    content {
      name = ztna_destination.value
    }
  }
  dynamic "internet_service_name" {
    for_each = [for o in each.value.internet_service_name : o]
    content {
      name = internet_service_name.value
    }
  }
  dynamic "internet_service_id" {
    for_each = [for o in each.value.internet_service_id : o]
    content {
      id = internet_service_id.value
    }
  }
  dynamic "internet_service_group" {
    for_each = [for o in each.value.internet_service_group : o]
    content {
      name = internet_service_group.value
    }
  }
  dynamic "internet_service_custom" {
    for_each = [for o in each.value.internet_service_custom : o]
    content {
      name = internet_service_custom.value
    }
  }
  dynamic "network_service_dynamic" {
    for_each = [for o in each.value.network_service_dynamic : o]
    content {
      name = network_service_dynamic.value
    }
  }
  dynamic "internet_service_custom_group" {
    for_each = [for o in each.value.internet_service_custom_group : o]
    content {
      name = internet_service_custom_group.value
    }
  }
  dynamic "internet_service_src_name" {
    for_each = [for o in each.value.internet_service_src_name : o]
    content {
      name = internet_service_src_name.value
    }
  }
  dynamic "internet_service_src_id" {
    for_each = [for o in each.value.internet_service_src_id : o]
    content {
      id = internet_service_src_id.value
    }
  }
  dynamic "internet_service_src_group" {
    for_each = [for o in each.value.internet_service_src_group : o]
    content {
      name = internet_service_src_group.value
    }
  }
  dynamic "internet_service_src_custom" {
    for_each = [for o in each.value.internet_service_src_custom : o]
    content {
      name = internet_service_src_custom.value
    }
  }
  dynamic "network_service_src_dynamic" {
    for_each = [for o in each.value.network_service_src_dynamic : o]
    content {
      name = network_service_src_dynamic.value
    }
  }
  dynamic "internet_service_src_custom_group" {
    for_each = [for o in each.value.internet_service_src_custom_group : o]
    content {
      name = internet_service_src_custom_group.value
    }
  }
  dynamic "src_vendor_mac" {
    for_each = [for o in each.value.src_vendor_mac : o]
    content {
      id = src_vendor_mac.value
    }
  }
  dynamic "internet_service6_name" {
    for_each = [for o in each.value.internet_service6_name : o]
    content {
      name = internet_service6_name.value
    }
  }
  dynamic "internet_service6_group" {
    for_each = [for o in each.value.internet_service6_group : o]
    content {
      name = internet_service6_group.value
    }
  }
  dynamic "internet_service6_custom" {
    for_each = [for o in each.value.internet_service6_custom : o]
    content {
      name = internet_service6_custom.value
    }
  }
  dynamic "internet_service6_custom_group" {
    for_each = [for o in each.value.internet_service6_custom_group : o]
    content {
      name = internet_service6_custom_group.value
    }
  }
  dynamic "internet_service6_src_name" {
    for_each = [for o in each.value.internet_service6_src_name : o]
    content {
      name = internet_service6_src_name.value
    }
  }
  dynamic "internet_service6_src_group" {
    for_each = [for o in each.value.internet_service6_src_group : o]
    content {
      name = internet_service6_src_group.value
    }
  }
  dynamic "internet_service6_src_custom" {
    for_each = [for o in each.value.internet_service6_src_custom : o]
    content {
      name = internet_service6_src_custom.value
    }
  }
  dynamic "internet_service6_src_custom_group" {
    for_each = [for o in each.value.internet_service6_src_custom_group : o]
    content {
      name = internet_service6_src_custom_group.value
    }
  }
  dynamic "rtp_addr" {
    for_each = [for o in each.value.rtp_addr : o]
    content {
      name = rtp_addr.value
    }
  }
  dynamic "service" {
    for_each = [for o in each.value.service : o]
    content {
      name = service.value
    }
  }
  dynamic "application" {
    for_each = [for o in each.value.application : o]
    content {
      id = application.value
    }
  }
  dynamic "app_category" {
    for_each = [for o in each.value.app_category : o]
    content {
      id = app_category.value
    }
  }
  dynamic "url_category" {
    for_each = [for o in each.value.url_category : o]
    content {
      id = url_category.value
    }
  }
  dynamic "app_group" {
    for_each = [for o in each.value.app_group : o]
    content {
      name = app_group.value
    }
  }
  dynamic "pcp_poolname" {
    for_each = [for o in each.value.pcp_poolname : o]
    content {
      name = pcp_poolname.value
    }
  }
  dynamic "poolname" {
    for_each = [for o in each.value.poolname : o]
    content {
      name = poolname.value
    }
  }
  dynamic "poolname6" {
    for_each = [for o in each.value.poolname6 : o]
    content {
      name = poolname6.value
    }
  }
  dynamic "ntlm_enabled_browsers" {
    for_each = [for o in each.value.ntlm_enabled_browsers : o]
    content {
      user_agent_string = ntlm_enabled_browsers.value
    }
  }
  dynamic "groups" {
    for_each = [for o in each.value.groups : o]
    content {
      name = groups.value
    }
  }
  dynamic "users" {
    for_each = [for o in each.value.users : o]
    content {
      name = users.value
    }
  }
  dynamic "fsso_groups" {
    for_each = [for o in each.value.fsso_groups : o]
    content {
      name = fsso_groups.value
    }
  }
  dynamic "scim_users" {
    for_each = [for o in each.value.scim_users : o]
    content {
      name = scim_users.value
    }
  }
  dynamic "scim_groups" {
    for_each = [for o in each.value.scim_groups : o]
    content {
      name = scim_groups.value
    }
  }
  dynamic "devices" {
    for_each = [for o in each.value.devices : o]
    content {
      name = devices.value
    }
  }
  dynamic "custom_log_fields" {
    for_each = [for o in each.value.custom_log_fields : o]
    content {
      field_id = custom_log_fields.value
    }
  }
  dynamic "ssl_mirror_intf" {
    for_each = [for o in each.value.ssl_mirror_intf : o]
    content {
      name = ssl_mirror_intf.value
    }
  }
  dynamic "sgt" {
    for_each = [for o in each.value.sgt : o]
    content {
      id = sgt.value
    }
  }
  dynamic "internet_service_fortiguard" {
    for_each = [for o in each.value.internet_service_fortiguard : o]
    content {
      name = internet_service_fortiguard.value
    }
  }
  dynamic "internet_service_src_fortiguard" {
    for_each = [for o in each.value.internet_service_src_fortiguard : o]
    content {
      name = internet_service_src_fortiguard.value
    }
  }
  dynamic "internet_service6_fortiguard" {
    for_each = [for o in each.value.internet_service6_fortiguard : o]
    content {
      name = internet_service6_fortiguard.value
    }
  }
  dynamic "internet_service6_src_fortiguard" {
    for_each = [for o in each.value.internet_service6_src_fortiguard : o]
    content {
      name = internet_service6_src_fortiguard.value
    }
  }

  dynamic "fabric_policy" {
    for_each = [for o in each.value.fabric_policy : o]
    content {
      from = fabric_policy.value.from
      to   = fabric_policy.value.to
    }
  }
}
