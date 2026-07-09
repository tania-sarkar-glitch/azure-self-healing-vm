environment = "prod"

resource_group_name = "rg-platform-prod"

location = "westus"

hub_vnet_name = "vnet-hub-prod"

hub_address_space = [
  "10.20.0.0/16"
]

gateway_subnet_prefix = "10.20.0.0/24"

shared_services_subnet_prefix = "10.20.1.0/24"

spoke_vnet_name = "vnet-spoke-prod"

spoke_address_space = [
  "10.21.0.0/16"
]

workload_subnet_name = "snet-workload-prod"

workload_subnet_prefix = "10.21.1.0/24"