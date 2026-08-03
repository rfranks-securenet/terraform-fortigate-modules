variable "policy" {
  description = "Firewall rules to create"
  default     = []

  type = list(object({
    policyid                           = optional(string)
    name                               = optional(string)
    uuid                               = optional(string)
    fabric_object                      = optional(string)
    fabric_force_sync                  = optional(string)
    fabric_object_source               = optional(string)
    srcintf                            = list(string)
    dstintf                            = list(string)
    srcaddr                            = optional(list(string), [])
    dstaddr                            = optional(list(string), [])
    srcaddr6                           = optional(list(string), [])
    dstaddr6                           = optional(list(string), [])
    ztna_status                        = optional(string)
    ztna_device_ownership              = optional(string)
    custom_tags                        = optional(list(string), [])
    ztna_ems_tag                       = optional(list(string), [])
    ztna_ems_tag_secondary             = optional(list(string), [])
    ztna_ems_tag6                      = optional(list(string), [])
    ztna_tags_match_logic              = optional(string)
    ztna_geo_tag                       = optional(list(string), [])
    ztna_destination                   = optional(list(string), [])
    internet_service                   = optional(string)
    internet_service_name              = optional(list(string), [])
    internet_service_id                = optional(list(string), [])
    internet_service_group             = optional(list(string), [])
    internet_service_custom            = optional(list(string), [])
    network_service_dynamic            = optional(list(string), [])
    internet_service_custom_group      = optional(list(string), [])
    internet_service_src               = optional(string)
    internet_service_src_name          = optional(list(string), [])
    internet_service_src_id            = optional(list(string), [])
    internet_service_src_group         = optional(list(string), [])
    internet_service_src_custom        = optional(list(string), [])
    network_service_src_dynamic        = optional(list(string), [])
    internet_service_src_custom_group  = optional(list(string), [])
    reputation_minimum                 = optional(string)
    reputation_direction               = optional(string)
    src_vendor_mac                     = optional(list(string), [])
    internet_service6                  = optional(string)
    internet_service6_name             = optional(list(string), [])
    internet_service6_group            = optional(list(string), [])
    internet_service6_custom           = optional(list(string), [])
    internet_service6_custom_group     = optional(list(string), [])
    internet_service6_src              = optional(string)
    internet_service6_src_name         = optional(list(string), [])
    internet_service6_src_group        = optional(list(string), [])
    internet_service6_src_custom       = optional(list(string), [])
    internet_service6_src_custom_group = optional(list(string), [])
    reputation_minimum6                = optional(string)
    reputation_direction6              = optional(string)
    rtp_nat                            = optional(string)
    rtp_addr                           = optional(list(string), [])
    learning_mode                      = optional(string)
    action                             = optional(string)
    nat64                              = optional(string)
    nat46                              = optional(string)
    send_deny_packet                   = optional(string)
    firewall_session_dirty             = optional(string)
    status                             = optional(string)
    schedule                           = optional(string)
    schedule_timeout                   = optional(string)
    policy_expiry                      = optional(string)
    policy_expiry_date                 = optional(string)
    policy_expiry_date_utc             = optional(string)
    service                            = optional(list(string), [])
    tos                                = optional(string)
    tos_mask                           = optional(string)
    tos_negate                         = optional(string)
    anti_replay                        = optional(string)
    tcp_session_without_syn            = optional(string)
    geoip_anycast                      = optional(string)
    geoip_match                        = optional(string)
    dynamic_shaping                    = optional(string)
    passive_wan_health_measurement     = optional(string)
    app_monitor                        = optional(string)
    utm_status                         = optional(string)
    inspection_mode                    = optional(string)
    http_policy_redirect               = optional(string)
    ssh_policy_redirect                = optional(string)
    ztna_policy_redirect               = optional(string)
    webproxy_profile                   = optional(string)
    profile_type                       = optional(string)
    profile_group                      = optional(string)
    av_profile                         = optional(string)
    webfilter_profile                  = optional(string)
    dnsfilter_profile                  = optional(string)
    emailfilter_profile                = optional(string)
    dlp_profile                        = optional(string)
    spamfilter_profile                 = optional(string)
    dlp_sensor                         = optional(string)
    file_filter_profile                = optional(string)
    ips_sensor                         = optional(string)
    application_list                   = optional(string)
    voip_profile                       = optional(string)
    ips_voip_filter                    = optional(string)
    sctp_filter_profile                = optional(string)
    diameter_filter_profile            = optional(string)
    virtual_patch_profile              = optional(string)
    icap_profile                       = optional(string)
    cifs_profile                       = optional(string)
    videofilter_profile                = optional(string)
    waf_profile                        = optional(string)
    ssh_filter_profile                 = optional(string)
    casb_profile                       = optional(string)
    telemetry_profile                  = optional(string)
    llm_profile                        = optional(string)
    profile_protocol_options           = optional(string)
    ssl_ssh_profile                    = optional(string)
    logtraffic                         = optional(string)
    logtraffic_start                   = optional(string)
    log_http_transaction               = optional(string)
    capture_packet                     = optional(string)
    auto_asic_offload                  = optional(string)
    np_acceleration                    = optional(string)
    wanopt                             = optional(string)
    wanopt_detection                   = optional(string)
    wanopt_passive_opt                 = optional(string)
    wanopt_profile                     = optional(string)
    wanopt_peer                        = optional(string)
    webcache                           = optional(string)
    webcache_https                     = optional(string)
    webproxy_forward_server            = optional(string)
    traffic_shaper                     = optional(string)
    traffic_shaper_reverse             = optional(string)
    per_ip_shaper                      = optional(string)
    application                        = optional(list(string), [])
    app_category                       = optional(list(string), [])
    url_category                       = optional(list(string), [])
    app_group                          = optional(list(string), [])
    nat                                = optional(string)
    pcp_outbound                       = optional(string)
    pcp_inbound                        = optional(string)
    pcp_poolname                       = optional(list(string), [])
    permit_any_host                    = optional(string)
    permit_stun_host                   = optional(string)
    fixedport                          = optional(string)
    port_preserve                      = optional(string)
    port_random                        = optional(string)
    ippool                             = optional(string)
    poolname                           = optional(list(string), [])
    poolname6                          = optional(list(string), [])
    session_ttl                        = optional(number)
    vlan_cos_fwd                       = optional(number)
    vlan_cos_rev                       = optional(number)
    inbound                            = optional(string)
    outbound                           = optional(string)
    natinbound                         = optional(string)
    natoutbound                        = optional(string)
    fec                                = optional(string)
    wccp                               = optional(string)
    ntlm                               = optional(string)
    ntlm_guest                         = optional(string)
    ntlm_enabled_browsers              = optional(list(string), [])
    fsso                               = optional(string)
    wsso                               = optional(string)
    rsso                               = optional(string)
    fsso_agent_for_ntlm                = optional(string)
    groups                             = optional(list(string), [])
    users                              = optional(list(string), [])
    fsso_groups                        = optional(list(string), [])
    scim                               = optional(string)
    saml_server                        = optional(string)
    scim_users                         = optional(list(string), [])
    scim_groups                        = optional(list(string), [])
    devices                            = optional(list(string), [])
    auth_path                          = optional(string)
    disclaimer                         = optional(string)
    email_collect                      = optional(string)
    vpntunnel                          = optional(string)
    natip                              = optional(string)
    match_vip                          = optional(string)
    match_vip_only                     = optional(string)
    diffserv_copy                      = optional(string)
    skip_vrf_match                     = optional(string)
    diffserv_forward                   = optional(string)
    diffserv_reverse                   = optional(string)
    diffservcode_forward               = optional(string)
    diffservcode_rev                   = optional(string)
    tcp_mss_sender                     = optional(number)
    tcp_mss_receiver                   = optional(number)
    comments                           = optional(string)
    label                              = optional(string)
    global_label                       = optional(string)
    auth_cert                          = optional(string)
    auth_redirect_addr                 = optional(string)
    redirect_url                       = optional(string)
    identity_based_route               = optional(string)
    block_notification                 = optional(string)
    custom_log_fields                  = optional(list(string), [])
    replacemsg_override_group          = optional(string)
    srcaddr_negate                     = optional(string)
    srcaddr6_negate                    = optional(string)
    dstaddr_negate                     = optional(string)
    dstaddr6_negate                    = optional(string)
    ztna_ems_tag_negate                = optional(string)
    service_negate                     = optional(string)
    internet_service_negate            = optional(string)
    internet_service_src_negate        = optional(string)
    internet_service6_negate           = optional(string)
    internet_service6_src_negate       = optional(string)
    timeout_send_rst                   = optional(string)
    captive_portal_exempt              = optional(string)
    decrypted_traffic_mirror           = optional(string)
    ssl_mirror                         = optional(string)
    ssl_mirror_intf                    = optional(list(string), [])
    scan_botnet_connections            = optional(string)
    dsri                               = optional(string)
    radius_mac_auth_bypass             = optional(string)
    radius_ip_auth_bypass              = optional(string)
    delay_tcp_npu_session              = optional(string)
    vlan_filter                        = optional(string)
    sgt_check                          = optional(string)
    sgt                                = optional(list(string), [])
    internet_service_fortiguard        = optional(list(string), [])
    internet_service_src_fortiguard    = optional(list(string), [])
    internet_service6_fortiguard       = optional(list(string), [])
    internet_service6_src_fortiguard   = optional(list(string), [])
    fabric_policy = optional(list(object({
      from = optional(string)
      to   = optional(string)
    })), [])
    dynamic_sort_subtable = optional(string, "natural")
    get_all_tables        = optional(bool, false)
    vdomparam             = optional(string)
    update_if_exist       = optional(bool)
  }))

  validation {
    condition     = alltrue(flatten([for o in var.policy : o.fabric_object == null || contains(["enable", "disable"], o.fabric_object)]))
    error_message = "Parameter `fabric_object` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.fabric_force_sync == null || contains(["enable", "disable"], o.fabric_force_sync)]))
    error_message = "Parameter `fabric_force_sync` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.fabric_object_source == null || contains(["member", "local", "root"], o.fabric_object_source)]))
    error_message = "Parameter `fabric_object_source` must be one of `member`, `local`, `root`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ztna_status == null || contains(["enable", "disable"], o.ztna_status)]))
    error_message = "Parameter `ztna_status` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ztna_device_ownership == null || contains(["enable", "disable"], o.ztna_device_ownership)]))
    error_message = "Parameter `ztna_device_ownership` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ztna_tags_match_logic == null || contains(["or", "and"], o.ztna_tags_match_logic)]))
    error_message = "Parameter `ztna_tags_match_logic` must be one of `or`, `and`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.internet_service == null || contains(["enable", "disable"], o.internet_service)]))
    error_message = "Parameter `internet_service` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.internet_service_src == null || contains(["enable", "disable"], o.internet_service_src)]))
    error_message = "Parameter `internet_service_src` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.reputation_direction == null || contains(["source", "destination"], o.reputation_direction)]))
    error_message = "Parameter `reputation_direction` must be one of `source`, `destination`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.internet_service6 == null || contains(["enable", "disable"], o.internet_service6)]))
    error_message = "Parameter `internet_service6` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.internet_service6_src == null || contains(["enable", "disable"], o.internet_service6_src)]))
    error_message = "Parameter `internet_service6_src` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.reputation_direction6 == null || contains(["source", "destination"], o.reputation_direction6)]))
    error_message = "Parameter `reputation_direction6` must be one of `source`, `destination`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.rtp_nat == null || contains(["disable", "enable"], o.rtp_nat)]))
    error_message = "Parameter `rtp_nat` must be one of `disable`, `enable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.learning_mode == null || contains(["enable", "disable"], o.learning_mode)]))
    error_message = "Parameter `learning_mode` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.action == null || contains(["accept", "deny", "ipsec"], o.action)]))
    error_message = "Parameter `action` must be one of `accept`, `deny`, `ipsec`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.nat64 == null || contains(["enable", "disable"], o.nat64)]))
    error_message = "Parameter `nat64` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.nat46 == null || contains(["enable", "disable"], o.nat46)]))
    error_message = "Parameter `nat46` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.send_deny_packet == null || contains(["disable", "enable"], o.send_deny_packet)]))
    error_message = "Parameter `send_deny_packet` must be one of `disable`, `enable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.firewall_session_dirty == null || contains(["check-all", "check-new"], o.firewall_session_dirty)]))
    error_message = "Parameter `firewall_session_dirty` must be one of `check-all`, `check-new`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.status == null || contains(["enable", "disable"], o.status)]))
    error_message = "Parameter `status` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.schedule_timeout == null || contains(["enable", "disable"], o.schedule_timeout)]))
    error_message = "Parameter `schedule_timeout` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.policy_expiry == null || contains(["enable", "disable"], o.policy_expiry)]))
    error_message = "Parameter `policy_expiry` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.tos_negate == null || contains(["enable", "disable"], o.tos_negate)]))
    error_message = "Parameter `tos_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.anti_replay == null || contains(["enable", "disable"], o.anti_replay)]))
    error_message = "Parameter `anti_replay` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.tcp_session_without_syn == null || contains(["all", "data-only", "disable"], o.tcp_session_without_syn)]))
    error_message = "Parameter `tcp_session_without_syn` must be one of `all`, `data-only`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.geoip_anycast == null || contains(["enable", "disable"], o.geoip_anycast)]))
    error_message = "Parameter `geoip_anycast` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.geoip_match == null || contains(["physical-location", "registered-location"], o.geoip_match)]))
    error_message = "Parameter `geoip_match` must be one of `physical-location`, `registered-location`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.dynamic_shaping == null || contains(["enable", "disable"], o.dynamic_shaping)]))
    error_message = "Parameter `dynamic_shaping` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.passive_wan_health_measurement == null || contains(["enable", "disable"], o.passive_wan_health_measurement)]))
    error_message = "Parameter `passive_wan_health_measurement` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.app_monitor == null || contains(["enable", "disable"], o.app_monitor)]))
    error_message = "Parameter `app_monitor` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.utm_status == null || contains(["enable", "disable"], o.utm_status)]))
    error_message = "Parameter `utm_status` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.inspection_mode == null || contains(["proxy", "flow"], o.inspection_mode)]))
    error_message = "Parameter `inspection_mode` must be one of `proxy`, `flow`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ssh_policy_redirect == null || contains(["enable", "disable"], o.ssh_policy_redirect)]))
    error_message = "Parameter `ssh_policy_redirect` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ztna_policy_redirect == null || contains(["enable", "disable"], o.ztna_policy_redirect)]))
    error_message = "Parameter `ztna_policy_redirect` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.profile_type == null || contains(["single", "group"], o.profile_type)]))
    error_message = "Parameter `profile_type` must be one of `single`, `group`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.logtraffic == null || contains(["all", "utm", "disable"], o.logtraffic)]))
    error_message = "Parameter `logtraffic` must be one of `all`, `utm`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.logtraffic_start == null || contains(["enable", "disable"], o.logtraffic_start)]))
    error_message = "Parameter `logtraffic_start` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.log_http_transaction == null || contains(["enable", "disable"], o.log_http_transaction)]))
    error_message = "Parameter `log_http_transaction` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.capture_packet == null || contains(["enable", "disable"], o.capture_packet)]))
    error_message = "Parameter `capture_packet` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.auto_asic_offload == null || contains(["enable", "disable"], o.auto_asic_offload)]))
    error_message = "Parameter `auto_asic_offload` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.np_acceleration == null || contains(["enable", "disable"], o.np_acceleration)]))
    error_message = "Parameter `np_acceleration` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.wanopt == null || contains(["enable", "disable"], o.wanopt)]))
    error_message = "Parameter `wanopt` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.wanopt_detection == null || contains(["active", "passive", "off"], o.wanopt_detection)]))
    error_message = "Parameter `wanopt_detection` must be one of `active`, `passive`, `off`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.wanopt_passive_opt == null || contains(["default", "transparent", "non-transparent"], o.wanopt_passive_opt)]))
    error_message = "Parameter `wanopt_passive_opt` must be one of `default`, `transparent`, `non-transparent`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.webcache == null || contains(["enable", "disable"], o.webcache)]))
    error_message = "Parameter `webcache` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.webcache_https == null || contains(["disable", "enable"], o.webcache_https)]))
    error_message = "Parameter `webcache_https` must be one of `disable`, `enable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.nat == null || contains(["enable", "disable"], o.nat)]))
    error_message = "Parameter `nat` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.pcp_outbound == null || contains(["enable", "disable"], o.pcp_outbound)]))
    error_message = "Parameter `pcp_outbound` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.pcp_inbound == null || contains(["enable", "disable"], o.pcp_inbound)]))
    error_message = "Parameter `pcp_inbound` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.permit_any_host == null || contains(["enable", "disable"], o.permit_any_host)]))
    error_message = "Parameter `permit_any_host` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.permit_stun_host == null || contains(["enable", "disable"], o.permit_stun_host)]))
    error_message = "Parameter `permit_stun_host` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.fixedport == null || contains(["enable", "disable"], o.fixedport)]))
    error_message = "Parameter `fixedport` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.port_preserve == null || contains(["enable", "disable"], o.port_preserve)]))
    error_message = "Parameter `port_preserve` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.port_random == null || contains(["enable", "disable"], o.port_random)]))
    error_message = "Parameter `port_random` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ippool == null || contains(["enable", "disable"], o.ippool)]))
    error_message = "Parameter `ippool` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.vlan_cos_fwd == null || contains([0, 1, 2, 3, 4, 5, 6, 7, 255], o.vlan_cos_fwd)]))
    error_message = "Parameter `vlan_cos_fwd` must be one of `0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `255`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.vlan_cos_rev == null || contains([0, 1, 2, 3, 4, 5, 6, 7, 255], o.vlan_cos_rev)]))
    error_message = "Parameter `vlan_cos_rev` must be one of `0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `255`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.inbound == null || contains(["enable", "disable"], o.inbound)]))
    error_message = "Parameter `inbound` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.outbound == null || contains(["enable", "disable"], o.outbound)]))
    error_message = "Parameter `outbound` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.natinbound == null || contains(["enable", "disable"], o.natinbound)]))
    error_message = "Parameter `natinbound` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.natoutbound == null || contains(["enable", "disable"], o.natoutbound)]))
    error_message = "Parameter `natoutbound` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.fec == null || contains(["enable", "disable"], o.fec)]))
    error_message = "Parameter `fec` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.wccp == null || contains(["enable", "disable"], o.wccp)]))
    error_message = "Parameter `wccp` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ntlm == null || contains(["enable", "disable"], o.ntlm)]))
    error_message = "Parameter `ntlm` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ntlm_guest == null || contains(["enable", "disable"], o.ntlm_guest)]))
    error_message = "Parameter `ntlm_guest` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.fsso == null || contains(["enable", "disable"], o.fsso)]))
    error_message = "Parameter `fsso` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.wsso == null || contains(["enable", "disable"], o.wsso)]))
    error_message = "Parameter `wsso` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.rsso == null || contains(["enable", "disable"], o.rsso)]))
    error_message = "Parameter `rsso` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.scim == null || contains(["enable", "disable"], o.scim)]))
    error_message = "Parameter `scim` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.auth_path == null || contains(["enable", "disable"], o.auth_path)]))
    error_message = "Parameter `auth_path` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.disclaimer == null || contains(["enable", "disable"], o.disclaimer)]))
    error_message = "Parameter `disclaimer` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.email_collect == null || contains(["enable", "disable"], o.email_collect)]))
    error_message = "Parameter `email_collect` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.match_vip == null || contains(["enable", "disable"], o.match_vip)]))
    error_message = "Parameter `match_vip` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.match_vip_only == null || contains(["enable", "disable"], o.match_vip_only)]))
    error_message = "Parameter `match_vip_only` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.diffserv_copy == null || contains(["enable", "disable"], o.diffserv_copy)]))
    error_message = "Parameter `diffserv_copy` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.skip_vrf_match == null || contains(["enable", "disable"], o.skip_vrf_match)]))
    error_message = "Parameter `skip_vrf_match` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.diffserv_forward == null || contains(["enable", "disable"], o.diffserv_forward)]))
    error_message = "Parameter `diffserv_forward` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.diffserv_reverse == null || contains(["enable", "disable"], o.diffserv_reverse)]))
    error_message = "Parameter `diffserv_reverse` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.block_notification == null || contains(["enable", "disable"], o.block_notification)]))
    error_message = "Parameter `block_notification` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.srcaddr_negate == null || contains(["enable", "disable"], o.srcaddr_negate)]))
    error_message = "Parameter `srcaddr_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.srcaddr6_negate == null || contains(["enable", "disable"], o.srcaddr6_negate)]))
    error_message = "Parameter `srcaddr6_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.dstaddr_negate == null || contains(["enable", "disable"], o.dstaddr_negate)]))
    error_message = "Parameter `dstaddr_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.dstaddr6_negate == null || contains(["enable", "disable"], o.dstaddr6_negate)]))
    error_message = "Parameter `dstaddr6_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ztna_ems_tag_negate == null || contains(["enable", "disable"], o.ztna_ems_tag_negate)]))
    error_message = "Parameter `ztna_ems_tag_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.service_negate == null || contains(["enable", "disable"], o.service_negate)]))
    error_message = "Parameter `service_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.internet_service_negate == null || contains(["enable", "disable"], o.internet_service_negate)]))
    error_message = "Parameter `internet_service_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.internet_service_src_negate == null || contains(["enable", "disable"], o.internet_service_src_negate)]))
    error_message = "Parameter `internet_service_src_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.internet_service6_negate == null || contains(["enable", "disable"], o.internet_service6_negate)]))
    error_message = "Parameter `internet_service6_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.internet_service6_src_negate == null || contains(["enable", "disable"], o.internet_service6_src_negate)]))
    error_message = "Parameter `internet_service6_src_negate` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.timeout_send_rst == null || contains(["enable", "disable"], o.timeout_send_rst)]))
    error_message = "Parameter `timeout_send_rst` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.captive_portal_exempt == null || contains(["enable", "disable"], o.captive_portal_exempt)]))
    error_message = "Parameter `captive_portal_exempt` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.ssl_mirror == null || contains(["enable", "disable"], o.ssl_mirror)]))
    error_message = "Parameter `ssl_mirror` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.scan_botnet_connections == null || contains(["disable", "block", "monitor"], o.scan_botnet_connections)]))
    error_message = "Parameter `scan_botnet_connections` must be one of `disable`, `block`, `monitor`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.dsri == null || contains(["enable", "disable"], o.dsri)]))
    error_message = "Parameter `dsri` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.radius_mac_auth_bypass == null || contains(["enable", "disable"], o.radius_mac_auth_bypass)]))
    error_message = "Parameter `radius_mac_auth_bypass` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.radius_ip_auth_bypass == null || contains(["enable", "disable"], o.radius_ip_auth_bypass)]))
    error_message = "Parameter `radius_ip_auth_bypass` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.delay_tcp_npu_session == null || contains(["enable", "disable"], o.delay_tcp_npu_session)]))
    error_message = "Parameter `delay_tcp_npu_session` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.sgt_check == null || contains(["enable", "disable"], o.sgt_check)]))
    error_message = "Parameter `sgt_check` must be one of `enable`, `disable`."
  }
  validation {
    condition     = alltrue(flatten([for o in var.policy : o.dynamic_sort_subtable == null || contains(["false", "true", "natural", "alphabetical"], o.dynamic_sort_subtable)]))
    error_message = "Parameter `dynamic_sort_subtable` must be one of `false`, `true`, `natural`, `alphabetical`."
  }
}
