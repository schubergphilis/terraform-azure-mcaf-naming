module "azure_region" {
  source       = "claranet/regions/azurerm"
  version      = "~> 7"
  azure_region = var.location
}

locals {
  environment    = "${var.customer_tla}${var.environment}"
  resourceprefix = "${var.customer_tla}${var.environment}-${var.workload}-${local.location}-${var.application}"
  subscription   = "${local.environment}-${var.workload}-sub"
  location       = module.azure_region.location_short

  format = {
    "E-G-L-S"          = [local.environment, var.workload, local.location, var.application]
    "E-G-L-S_shortend" = [substr(var.environment, 3, 3), var.workload, local.location, var.application]
    "G-E-L-S"          = [var.workload, local.environment, local.location, var.application]
    "G-E-L-S_shortend" = [var.workload, substr(var.environment, 3, 3), local.location, var.application]
  }

  abbreviations = {
    ai_ml = {
      search                      = format("%s-%s-%s-%s-srch", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      azure_machine_learning      = format("%s-%s-%s-%s-aisa", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      azure_video_indexer         = format("%s-%s-%s-%s-avi", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      machine_learning_workspaces = format("%s-%s-%s-%s-mlw", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      openai                      = format("%s-%s-%s-%s-oai", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      bot_services                = format("%s-%s-%s-%s-bot", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      computer_vision             = format("%s-%s-%s-%s-cv", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      custom_vision               = format("%s-%s-%s-%s-cm", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      custom_vision_training      = format("%s-%s-%s-%s-cstv", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      custom_vision_training_v3   = format("%s-%s-%s-%s-cstvt", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      data_integrity              = format("%s-%s-%s-%s-di", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      face_recognition            = format("%s-%s-%s-%s-face", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      health_insights             = format("%s-%s-%s-%s-hi", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      image_recognition           = format("%s-%s-%s-%s-ir", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      language_understanding      = format("%s-%s-%s-%s-lang", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      speech_services             = format("%s-%s-%s-%s-spch", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      translator_services         = format("%s-%s-%s-%s-trsl", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    analytics_iot = {
      analysis_services                                          = format("%s-%s-%s-%s-as", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      databricks_workspace                                       = format("%s-%s-%s-%s-dbw", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      data_explorer_cluster                                      = format("%s-%s-%s-%s-dec", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      data_explorer_database                                     = format("%s-%s-%s-%s-dedb", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      data_factory                                               = format("%s-%s-%s-%s-adf", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      digital_twins                                              = format("%s-%s-%s-%s-dt", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      stream_analytics_job                                       = format("%s-%s-%s-%s-asa", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      synapse_analytics_dedicated_sql_pools                      = format("%s-%s-%s-%s-synplh", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      synapse_analytics_dedicated_sql_pools_data_warehouse       = format("%s-%s-%s-%s-syndp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      synapse_analytics_dedicated_sql_pools_serverless_sql_pools = format("%s-%s-%s-%s-synsp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      synapse_workspace                                          = format("%s-%s-%s-%s-synw", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      data_lake_store                                            = format("%s-%s-%s-%s-dls", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      data_lake_analytics                                        = format("%s-%s-%s-%s-dla", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      event_hubs_namespace                                       = format("%s-%s-%s-%s-evhns", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      event_hubs                                                 = format("%s-%s-%s-%s-evh", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      event_hubs_authorization_rule                              = format("%s-%s-%s-%s-evhar", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      event_hubs_consumer_group                                  = format("%s-%s-%s-%s-evhcg", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      event_grid_domain                                          = format("%s-%s-%s-%s-evgd", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      event_grid_subscription                                    = format("%s-%s-%s-%s-evgs", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      event_grid_topic                                           = format("%s-%s-%s-%s-evgt", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      event_grid_system_topic                                    = format("%s-%s-%s-%s-egst", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      hadoop                                                     = format("%s-%s-%s-%s-hadoop", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      hbase                                                      = format("%s-%s-%s-%s-hbase", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      kafka                                                      = format("%s-%s-%s-%s-kafka", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      spark                                                      = format("%s-%s-%s-%s-spark", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      storm                                                      = format("%s-%s-%s-%s-storm", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      machine_learning_server                                    = format("%s-%s-%s-%s-mls", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      iot_hub                                                    = format("%s-%s-%s-%s-iot", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      provisioning_service                                       = format("%s-%s-%s-%s-provs", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      provisioning_certificates                                  = format("%s-%s-%s-%s-pcert", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      power_bi                                                   = format("%s-%s-%s-%s-pbi", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      time_series_insights                                       = format("%s-%s-%s-%s-tsi", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    compute_web = {
      app_service_environment   = format("%s-%s-%s-%s-ase", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      app_service_plan          = format("%s-%s-%s-%s-asp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      load_testing              = format("%s-%s-%s-%s-lt", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      availability_set          = format("%s-%s-%s-%s-avail", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      azure_arc_servers         = format("%s-%s-%s-%s-arcs", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      azure_arc_kubernetes      = format("%s-%s-%s-%s-arck", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      batch_account             = format("%s-%s-%s-%s-ba", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      cloud_service             = format("%s-%s-%s-%s-cld", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      container_service         = format("%s-%s-%s-%s-acs", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      dedicated_host            = format("%s-%s-%s-%s-des", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      function_app              = format("%s-%s-%s-%s-func", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      gallery                   = format("%s%s%s%sgal", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      hosting                   = format("%s-%s-%s-%s-host", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      image_template            = format("%s-%s-%s-%s-it", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      managed_disk              = format("%s-%s-%s-%s-osdisk", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      unmanaged_disk            = format("%s-%s-%s-%s-disk", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      disk_encryption_set       = format("%s-%s-%s-%s-des", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      network_interface_postfix = "-nic"
      proximity_placement_group = format("%s-%s-%s-%s-ppg", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      reserved_capacity         = format("%s-%s-%s-%s-rpc", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      snapshot                  = format("%s-%s-%s-%s-snap", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      service_tier              = format("%s-%s-%s-%s-stapp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      virtual_machine           = format("%s%s%s%s", local.format["${var.format}_shortend"][0], local.format["${var.format}_shortend"][1], local.format["${var.format}_shortend"][2], local.format["${var.format}_shortend"][3])
      virtual_machine_scale_set = format("%s-%s-%s-%s-vmss", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      machine_configuration     = format("%s-%s-%s-%s-mc", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      storage_vm                = format("%s-%s-%s-%s-stvm", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      web_app                   = format("%s-%s-%s-%s-app", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    containers = {
      aks                             = format("%s-%s-%s-%s-aks", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      aks_system_node_pool            = format("%s-%s-%s-%s-npsystem", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      aks_user_node_pool              = format("%s-%s-%s-%s-np", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      container_apps                  = format("%s-%s-%s-%s-ca", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      container_apps_environment      = format("%s-%s-%s-%s-cae", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      container_registry              = format("%s%s%s%sacr", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      container_instances             = format("%s-%s-%s-%s-aci", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      service_fabric                  = format("%s-%s-%s-%s-sf", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      service_fabric_managed_clusters = format("%s-%s-%s-%s-sfmc", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    databases = {
      cosmos_db                          = format("%s-%s-%s-%s-cosmos", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      cosmos_db_sql_api                  = format("%s-%s-%s-%s-coscas", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      cosmos_db_mongodb                  = format("%s-%s-%s-%s-cosmon", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      cosmos_db_cassandra                = format("%s-%s-%s-%s-cosno", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      cosmos_db_table                    = format("%s-%s-%s-%s-costab", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      cosmos_db_gremlin                  = format("%s-%s-%s-%s-cosgrm", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      cosmos_db_postgresql               = format("%s-%s-%s-%s-cospos", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      redis_cache                        = format("%s-%s-%s-%s-redis", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      sql_server                         = format("%s-%s-%s-%s-sql", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      sql_database                       = format("%s-%s-%s-%s-sqldb", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      sql_managed_instance               = format("%s-%s-%s-%s-sqlmi", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      sql_managed_instance_administrator = format("%s-%s-%s-%s-sqlja", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      sql_managed_instance_elastic_pool  = format("%s-%s-%s-%s-sqlep", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      mariadb                            = format("%s-%s-%s-%s-maria", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      mariadb_database                   = format("%s-%s-%s-%s-mariadb", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      mysql                              = format("%s-%s-%s-%s-mysql", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      postgresql                         = format("%s-%s-%s-%s-psql", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      sql_stretch_database               = format("%s-%s-%s-%s-sqlstrdb", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    developer_tools = {
      application_configuration_service = format("%s-%s-%s-%s-appcs", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      azure_maps                        = format("%s-%s-%s-%s-map", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      signalr_service                   = format("%s-%s-%s-%s-sigr", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      web_pubsub                        = format("%s-%s-%s-%s-wps", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    devops = {
      azure_monitoring_grafana = format("%s-%s-%s-%s-amg", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    integration = {
      api_management                 = format("%s-%s-%s-%s-apim", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      datadog                        = format("%s-%s-%s-%s-dd", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      integration_account            = format("%s-%s-%s-%s-ia", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      logic_apps                     = format("%s-%s-%s-%s-logic", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      service_bus_namespace          = format("%s-%s-%s-%s-sbns", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      service_bus_queue              = format("%s-%s-%s-%s-sbq", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      service_bus_topic              = format("%s-%s-%s-%s-sbt", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      service_bus_topic_subscription = format("%s-%s-%s-%s-sbts", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    management_governance = {
      automation_account       = format("%s-%s-%s-%s-aa", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      descriptive              = format("%s-%s-%s-%s-<descriptive>", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      application_insights     = format("%s-%s-%s-%s-appi", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      advisor                  = format("%s-%s-%s-%s-ag", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      data_collection_rules    = format("%s-%s-%s-%s-dcr", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      azure_policy             = format("%s-%s-%s-%s-apr", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      blueprints               = format("%s-%s-%s-%s-bp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      blueprints_assignment    = format("%s-%s-%s-%s-bpa", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      data_collection_endpoint = format("%s-%s-%s-%s-dce", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      log_analytics_workspace  = format("%s-%s-%s-%s-law", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      management_pack          = format("%s-%s-%s-%s-pack", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      management_groups        = format("%s-%s-%s-%s-mg", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      policy_view              = format("%s-%s-%s-%s-pview", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      resource_groups          = format("%s-%s-%s-%s-rsg", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      traffic_services         = format("%s-%s-%s-%s-ts", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    migration = {
      migration_service       = format("%s-%s-%s-%s-migr", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      data_migration_service  = format("%s-%s-%s-%s-dms", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      recovery_services_vault = format("%s-%s-%s-%s-rsv", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    networking = {
      application_gateway                    = format("%s-%s-%s-%s-agw", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      application_security_groups            = format("%s-%s-%s-%s-asg", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      cdn_profile                            = format("%s-%s-%s-%s-cdnp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      cdn_endpoint                           = format("%s-%s-%s-%s-cdne", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      connection                             = format("%s-%s-%s-%s-con", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      dns_domain_name                        = format("%s-%s-%s-%s-<DNS domain name>", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      dns_forwarder                          = format("%s-%s-%s-%s-dnsfrs", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      dns_private_resolver                   = format("%s-%s-%s-%s-dnspr", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      dns_private_resolver_inbound_endpoint  = format("%s-%s-%s-%s-iep", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      dns_private_resolver_outbound_endpoint = format("%s-%s-%s-%s-oep", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      azure_firewall                         = format("%s-%s-%s-%s-afw", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      azure_firewall_policy                  = format("%s-%s-%s-%s-afwp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      express_route_circuit                  = format("%s-%s-%s-%s-erc", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      express_route_gateway                  = format("%s-%s-%s-%s-ergw", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      front_door                             = format("%s-%s-%s-%s-afd", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      front_door_endpoint                    = format("%s-%s-%s-%s-fde", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      front_door_firewall_policy             = format("%s-%s-%s-%s-fdfp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      front_door_network                     = format("%s-%s-%s-%s-afd", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      ip_groups                              = format("%s-%s-%s-%s-ipg", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      load_balancer_inbound_nat_rule         = format("%s-%s-%s-%s-lbi", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      load_balancer_backend_address_pool     = format("%s-%s-%s-%s-lbe", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      load_balancer_rule                     = format("%s-%s-%s-%s-rule", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      local_network_gateway                  = format("%s-%s-%s-%s-lgw", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      network_security_group                 = format("%s-%s-%s-%s-nsg", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      network_security_group_security_rule   = format("%s-%s-%s-%s-nsgsr", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      network_watcher                        = format("%s-%s-%s-%s-nw", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      peering                                = format("%s-%s-%s-%s-pl", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      private_endpoint                       = format("%s-%s-%s-%s-pep", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      public_ip_address                      = format("%s-%s-%s-%s-pip", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      public_ip_prefix                       = format("%s-%s-%s-%s-ippre", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      route_filter                           = format("%s-%s-%s-%s-rf", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      route_table                            = format("%s-%s-%s-%s-rt", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      route_server                           = format("%s-%s-%s-%s-rtserv", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      routing_intent                         = format("%s-%s-%s-%s-ri", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      security_rule                          = format("%s-%s-%s-%s-se", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      traffic_manager                        = format("%s-%s-%s-%s-traf", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      user_defined_route                     = format("%s-%s-%s-%s-udr", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      virtual_network                        = format("%s-%s-%s-%s-vnet", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      virtual_network_gateway                = format("%s-%s-%s-%s-vgw", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      virtual_network_manager                = format("%s-%s-%s-%s-vnm", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      virtual_network_peering                = format("%s-%s-%s-%s-peer", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      subnet_postfix                         = "subnet"
      virtual_wan                            = format("%s-%s-%s-%s-vwan", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      virtual_hub                            = format("%s-%s-%s-%s-vhub", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    security = {
      azure_bastion                              = format("%s-%s-%s-%s-bas", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      key_vault                                  = format("%s-%s-%s-%s-kv", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      key_vault_managed_hardware_security_module = format("%s-%s-%s-%s-kvmhsm", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      identity                                   = format("%s-%s-%s-%s-id", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      user_managed_identity                      = format("%s-%s-%s-%s-mid", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      ssh_key                                    = format("%s-%s-%s-%s-sshkey", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      vpn_gateway                                = format("%s-%s-%s-%s-vpng", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      virtual_network_connector                  = format("%s-%s-%s-%s-vcn", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      virtual_security_token                     = format("%s-%s-%s-%s-vst", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      web_application_firewall                   = format("%s-%s-%s-%s-waf", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      web_application_firewall_policy            = format("%s-%s-%s-%s-wafrg", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    storage = {
      azure_import_export  = format("%s-%s-%s-%s-ssimp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      backup_vault         = format("%s-%s-%s-%s-bvault", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      backup_policy        = format("%s-%s-%s-%s-bkpol", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      file_share           = format("%s-%s-%s-%s-share", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      storage_account      = format("%s%s%s%ssta", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3]) # No - allowed in name
      storage_container    = format("%s%s%s%ssc", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])  # No - allowed in name
      storage_sync_service = format("%s-%s-%s-%s-sss", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }

    virtual_desktop_infrastructure = {
      host_pool         = format("%s-%s-%s-%s-lp", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      desktop_pool      = format("%s-%s-%s-%s-vdpool", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      application_group = format("%s-%s-%s-%s-vdag", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      workspace         = format("%s-%s-%s-%s-vdws", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
      scaling_plan      = format("%s-%s-%s-%s-vdscaling", local.format[var.format][0], local.format[var.format][1], local.format[var.format][2], local.format[var.format][3])
    }
  }
}
