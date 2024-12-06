locals {
  customer_environment = "${var.customer_acronym}${var.environment}"
  location             = lookup(local.location_lookup, lower(var.location), "unknown")

  format = {
    "E-G-L-S" = {
      params           = [local.customer_environment, var.workload, local.location.abbreviation, var.application]
      params_shortened = [var.environment, var.workload, local.location.abbreviation, var.application]
    }
    "G-E-L-S" = {
      params           = [var.workload, local.customer_environment, local.location.abbreviation, var.application]
      params_shortened = [var.workload, var.environment, local.location.abbreviation, var.application]
    }
  }

  resource_prefix           = format("%s-%s-%s-%s", local.format[var.format].params[0], local.format[var.format].params[1], local.format[var.format].params[2], local.format[var.format].params[3])
  resource_prefix_shortened = format("%s%s%s%s", local.format[var.format].params_shortened[0], local.format[var.format].params_shortened[1], local.format[var.format].params_shortened[2], local.format[var.format].params_shortened[3])

  resource_format_string     = "${local.resource_prefix}-%s"
  resource_format_no_hyphens = replace(local.resource_format_string, "-", "")
  resource_format_shortened  = "${local.resource_prefix_shortened}%s"

  names = {
    subscription = "${local.format[var.format].params[0]}-${local.format[var.format].params[1]}-sub"

    ai_ml = {
      search                      = format(local.resource_format_string, "srch")
      azure_machine_learning      = format(local.resource_format_string, "aisa")
      azure_video_indexer         = format(local.resource_format_string, "avi")
      machine_learning_workspaces = format(local.resource_format_string, "mlw")
      openai                      = format(local.resource_format_string, "oai")
      bot_services                = format(local.resource_format_string, "bot")
      computer_vision             = format(local.resource_format_string, "cv")
      custom_vision               = format(local.resource_format_string, "cm")
      custom_vision_training      = format(local.resource_format_string, "cstv")
      custom_vision_training_v3   = format(local.resource_format_string, "cstvt")
      data_integrity              = format(local.resource_format_string, "di")
      face_recognition            = format(local.resource_format_string, "face")
      health_insights             = format(local.resource_format_string, "hi")
      image_recognition           = format(local.resource_format_string, "ir")
      language_understanding      = format(local.resource_format_string, "lang")
      speech_services             = format(local.resource_format_string, "spch")
      translator_services         = format(local.resource_format_string, "trsl")
    }

    analytics_iot = {
      analysis_services                                          = format(local.resource_format_string, "as")
      databricks_workspace                                       = format(local.resource_format_string, "dbw")
      data_explorer_cluster                                      = format(local.resource_format_string, "dec")
      data_explorer_database                                     = format(local.resource_format_string, "dedb")
      data_factory                                               = format(local.resource_format_string, "adf")
      digital_twins                                              = format(local.resource_format_string, "dt")
      stream_analytics_job                                       = format(local.resource_format_string, "asa")
      synapse_analytics_dedicated_sql_pools                      = format(local.resource_format_string, "synplh")
      synapse_analytics_dedicated_sql_pools_data_warehouse       = format(local.resource_format_string, "syndp")
      synapse_analytics_dedicated_sql_pools_serverless_sql_pools = format(local.resource_format_string, "synsp")
      synapse_workspace                                          = format(local.resource_format_string, "synw")
      data_lake_store                                            = format(local.resource_format_string, "dls")
      data_lake_analytics                                        = format(local.resource_format_string, "dla")
      event_hubs_namespace                                       = format(local.resource_format_string, "evhns")
      event_hubs                                                 = format(local.resource_format_string, "evh")
      event_hubs_authorization_rule                              = format(local.resource_format_string, "evhar")
      event_hubs_consumer_group                                  = format(local.resource_format_string, "evhcg")
      event_grid_domain                                          = format(local.resource_format_string, "evgd")
      event_grid_subscription                                    = format(local.resource_format_string, "evgs")
      event_grid_topic                                           = format(local.resource_format_string, "evgt")
      event_grid_system_topic                                    = format(local.resource_format_string, "egst")
      hadoop                                                     = format(local.resource_format_string, "hadoop")
      hbase                                                      = format(local.resource_format_string, "hbase")
      kafka                                                      = format(local.resource_format_string, "kafka")
      spark                                                      = format(local.resource_format_string, "spark")
      storm                                                      = format(local.resource_format_string, "storm")
      machine_learning_server                                    = format(local.resource_format_string, "mls")
      iot_hub                                                    = format(local.resource_format_string, "iot")
      provisioning_service                                       = format(local.resource_format_string, "provs")
      provisioning_certificates                                  = format(local.resource_format_string, "pcert")
      power_bi                                                   = format(local.resource_format_string, "pbi")
      time_series_insights                                       = format(local.resource_format_string, "tsi")
    }

    compute_web = {
      app_service_environment   = format(local.resource_format_string, "ase")
      app_service_plan          = format(local.resource_format_string, "asp")
      load_testing              = format(local.resource_format_string, "lt")
      availability_set          = format(local.resource_format_string, "avail")
      azure_arc_servers         = format(local.resource_format_string, "arcs")
      azure_arc_kubernetes      = format(local.resource_format_string, "arck")
      batch_account             = format(local.resource_format_string, "ba")
      cloud_service             = format(local.resource_format_string, "cld")
      container_service         = format(local.resource_format_string, "acs")
      dedicated_host            = format(local.resource_format_string, "des")
      function_app              = format(local.resource_format_string, "func")
      gallery                   = format(local.resource_format_no_hyphens, "gal")
      hosting                   = format(local.resource_format_string, "host")
      image_template            = format(local.resource_format_string, "it")
      managed_disk              = format(local.resource_format_string, "osdisk")
      unmanaged_disk            = format(local.resource_format_string, "disk")
      disk_encryption_set       = format(local.resource_format_string, "des")
      network_interface_postfix = "-nic"
      proximity_placement_group = format(local.resource_format_string, "ppg")
      reserved_capacity         = format(local.resource_format_string, "rpc")
      snapshot                  = format(local.resource_format_string, "snap")
      service_tier              = format(local.resource_format_string, "stapp")
      virtual_machine_windows   = format(local.resource_format_shortened, "") // Omitting resource shorthand due to length limitation (15 characters)
      virtual_machine_linux     = format(local.resource_format_string, "vm")
      virtual_machine_scale_set = format(local.resource_format_string, "vmss")
      machine_configuration     = format(local.resource_format_string, "mc")
      storage_vm                = format(local.resource_format_string, "stvm")
      web_app                   = format(local.resource_format_string, "app")
    }

    containers = {
      aks                             = format(local.resource_format_string, "aks")
      aks_system_node_pool            = format(local.resource_format_string, "npsystem")
      aks_user_node_pool              = format(local.resource_format_string, "np")
      container_apps                  = format(local.resource_format_string, "ca")
      container_apps_environment      = format(local.resource_format_string, "cae")
      container_registry              = format(local.resource_format_no_hyphens, "cr")
      container_instances             = format(local.resource_format_string, "ci")
      service_fabric                  = format(local.resource_format_string, "sf")
      service_fabric_managed_clusters = format(local.resource_format_string, "sfmc")
    }

    databases = {
      cosmos_db                          = format(local.resource_format_string, "cosmos")
      cosmos_db_sql_api                  = format(local.resource_format_string, "coscas")
      cosmos_db_mongodb                  = format(local.resource_format_string, "cosmon")
      cosmos_db_cassandra                = format(local.resource_format_string, "cosno")
      cosmos_db_table                    = format(local.resource_format_string, "costab")
      cosmos_db_gremlin                  = format(local.resource_format_string, "cosgrm")
      cosmos_db_postgresql               = format(local.resource_format_string, "cospos")
      redis_cache                        = format(local.resource_format_string, "redis")
      sql_server                         = format(local.resource_format_string, "sql")
      sql_database                       = format(local.resource_format_string, "sqldb")
      sql_managed_instance               = format(local.resource_format_string, "sqlmi")
      sql_managed_instance_administrator = format(local.resource_format_string, "sqlja")
      sql_managed_instance_elastic_pool  = format(local.resource_format_string, "sqlep")
      mariadb                            = format(local.resource_format_string, "maria")
      mariadb_database                   = format(local.resource_format_string, "mariadb")
      mysql                              = format(local.resource_format_string, "mysql")
      postgresql                         = format(local.resource_format_string, "psql")
      sql_stretch_database               = format(local.resource_format_string, "sqlstrdb")
    }

    developer_tools = {
      application_configuration_service = format(local.resource_format_string, "appcs")
      azure_maps                        = format(local.resource_format_string, "map")
      signalr_service                   = format(local.resource_format_string, "sigr")
      web_pubsub                        = format(local.resource_format_string, "wps")
    }

    devops = {
      azure_monitoring_grafana = format(local.resource_format_string, "amg")
    }

    integration = {
      api_management                 = format(local.resource_format_string, "apim")
      datadog                        = format(local.resource_format_string, "dd")
      integration_account            = format(local.resource_format_string, "ia")
      logic_apps                     = format(local.resource_format_string, "logic")
      service_bus_namespace          = format(local.resource_format_string, "sbns")
      service_bus_queue              = format(local.resource_format_string, "sbq")
      service_bus_topic              = format(local.resource_format_string, "sbt")
      service_bus_topic_subscription = format(local.resource_format_string, "sbts")
    }

    management_governance = {
      automation_account       = format(local.resource_format_string, "aa")
      descriptive              = format(local.resource_format_string, "<descriptive>")
      application_insights     = format(local.resource_format_string, "appi")
      advisor                  = format(local.resource_format_string, "ag")
      data_collection_rules    = format(local.resource_format_string, "dcr")
      azure_policy             = format(local.resource_format_string, "apr")
      blueprints               = format(local.resource_format_string, "bp")
      blueprints_assignment    = format(local.resource_format_string, "bpa")
      data_collection_endpoint = format(local.resource_format_string, "dce")
      log_analytics_workspace  = format(local.resource_format_string, "law")
      management_pack          = format(local.resource_format_string, "pack")
      management_groups        = format(local.resource_format_string, "mg")
      policy_view              = format(local.resource_format_string, "pview")
      resource_groups          = format(local.resource_format_string, "rsg")
      traffic_services         = format(local.resource_format_string, "ts")
    }

    migration = {
      migration_service       = format(local.resource_format_string, "migr")
      data_migration_service  = format(local.resource_format_string, "dms")
      recovery_services_vault = format(local.resource_format_string, "rsv")
    }

    networking = {
      application_gateway                    = format(local.resource_format_string, "agw")
      application_security_groups            = format(local.resource_format_string, "asg")
      cdn_profile                            = format(local.resource_format_string, "cdnp")
      cdn_endpoint                           = format(local.resource_format_string, "cdne")
      connection                             = format(local.resource_format_string, "con")
      dns_domain_name                        = format(local.resource_format_string, "<DNS domain name>")
      dns_forwarder                          = format(local.resource_format_string, "dnsfrs")
      dns_private_resolver                   = format(local.resource_format_string, "dnspr")
      dns_private_resolver_inbound_endpoint  = format(local.resource_format_string, "iep")
      dns_private_resolver_outbound_endpoint = format(local.resource_format_string, "oep")
      azure_firewall                         = format(local.resource_format_string, "afw")
      azure_firewall_policy                  = format(local.resource_format_string, "afwp")
      express_route_circuit                  = format(local.resource_format_string, "erc")
      express_route_gateway                  = format(local.resource_format_string, "ergw")
      front_door                             = format(local.resource_format_string, "afd")
      front_door_endpoint                    = format(local.resource_format_string, "fde")
      front_door_firewall_policy             = format(local.resource_format_string, "fdfp")
      front_door_network                     = format(local.resource_format_string, "afd")
      ip_groups                              = format(local.resource_format_string, "ipg")
      load_balancer_inbound_nat_rule         = format(local.resource_format_string, "lbi")
      load_balancer_backend_address_pool     = format(local.resource_format_string, "lbe")
      load_balancer_rule                     = format(local.resource_format_string, "rule")
      local_network_gateway                  = format(local.resource_format_string, "lgw")
      network_security_group                 = format(local.resource_format_string, "nsg")
      network_security_group_security_rule   = format(local.resource_format_string, "nsgsr")
      network_watcher                        = format(local.resource_format_string, "nw")
      peering                                = format(local.resource_format_string, "pl")
      private_endpoint                       = format(local.resource_format_string, "pep")
      public_ip_address                      = format(local.resource_format_string, "pip")
      public_ip_prefix                       = format(local.resource_format_string, "ippre")
      route_filter                           = format(local.resource_format_string, "rf")
      route_table                            = format(local.resource_format_string, "rt")
      route_server                           = format(local.resource_format_string, "rtserv")
      routing_intent                         = format(local.resource_format_string, "ri")
      security_rule                          = format(local.resource_format_string, "se")
      traffic_manager                        = format(local.resource_format_string, "traf")
      user_defined_route                     = format(local.resource_format_string, "udr")
      virtual_network                        = format(local.resource_format_string, "vnet")
      virtual_network_gateway                = format(local.resource_format_string, "vgw")
      virtual_network_manager                = format(local.resource_format_string, "vnm")
      virtual_network_peering                = format(local.resource_format_string, "peer")
      subnet_postfix                         = "subnet"
      virtual_wan                            = format(local.resource_format_string, "vwan")
      virtual_hub                            = format(local.resource_format_string, "vhub")
    }

    security = {
      azure_bastion                              = format(local.resource_format_string, "bas")
      key_vault                                  = format(local.resource_format_string, "kv")
      key_vault_managed_hardware_security_module = format(local.resource_format_string, "kvmhsm")
      identity                                   = format(local.resource_format_string, "id")
      user_managed_identity                      = format(local.resource_format_string, "mid")
      ssh_key                                    = format(local.resource_format_string, "sshkey")
      vpn_gateway                                = format(local.resource_format_string, "vpng")
      virtual_network_connector                  = format(local.resource_format_string, "vcn")
      virtual_security_token                     = format(local.resource_format_string, "vst")
      web_application_firewall                   = format(local.resource_format_string, "waf")
      web_application_firewall_policy            = format(local.resource_format_string, "wafrg")
    }

    storage = {
      azure_import_export  = format(local.resource_format_string, "ssimp")
      backup_vault         = format(local.resource_format_string, "bvault")
      backup_policy        = format(local.resource_format_string, "bkpol")
      file_share           = format(local.resource_format_string, "share")
      storage_account      = format(local.resource_format_no_hyphens, "sta")
      storage_container    = format(local.resource_format_no_hyphens, "sc")
      storage_sync_service = format(local.resource_format_string, "sss")
    }

    virtual_desktop_infrastructure = {
      host_pool         = format(local.resource_format_string, "lp")
      desktop_pool      = format(local.resource_format_string, "vdpool")
      application_group = format(local.resource_format_string, "vdag")
      workspace         = format(local.resource_format_string, "vdws")
      scaling_plan      = format(local.resource_format_string, "vdscaling")
    }
  }

  locations = [
    { short_name : "northeurope", full_name : "North Europe", abbreviation : "neu" },
    { short_name : "westeurope", full_name : "West Europe", abbreviation : "weu" },
    { short_name : "francecentral", full_name : "France Central", abbreviation : "frc" },
    { short_name : "francesouth", full_name : "France South", abbreviation : "frs" },
    { short_name : "germanynorth", full_name : "Germany North", abbreviation : "gno" },
    { short_name : "germanywestcentral", full_name : "Germany West Central", abbreviation : "gwc" },
    { short_name : "italynorth", full_name : "Italy North", abbreviation : "itn" },
    { short_name : "norwayeast", full_name : "Norway East", abbreviation : "noe" },
    { short_name : "norwaywest", full_name : "Norway West", abbreviation : "now" },
    { short_name : "polandcentral", full_name : "Poland Central", abbreviation : "plc" },
    { short_name : "swedencentral", full_name : "Sweden Central", abbreviation : "sdc" },
    { short_name : "swedensouth", full_name : "Sweden South", abbreviation : "sds" }
  ]

  location_lookup = merge(
    { for location in local.locations : lower(location.short_name) => location },
    { for location in local.locations : lower(location.full_name) => location }
  )
}
