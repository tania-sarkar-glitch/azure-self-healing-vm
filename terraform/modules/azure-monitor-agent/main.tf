resource "azurerm_monitor_data_collection_rule" "self_healing" {

  name                = "dcr-selfheal"
  location            = var.location
  resource_group_name = var.resource_group_name

  destinations {

    log_analytics {

      workspace_resource_id = var.workspace_resource_id

      name = "law"

    }

  }

  data_flow {

    streams = ["Microsoft-Syslog"]

    destinations = ["law"]

  }

  data_sources {

    syslog {

      facility_names = [
        "*"
      ]

      log_levels = [
        "*"
      ]

      streams = [
        "Microsoft-Syslog"
      ]

      name = "syslog"

    }

  }

  tags = var.tags

}

resource "azurerm_monitor_data_collection_rule_association" "vm" {

  name = "dcr-association"

  target_resource_id = var.vm_id

  data_collection_rule_id = azurerm_monitor_data_collection_rule.self_healing.id

}