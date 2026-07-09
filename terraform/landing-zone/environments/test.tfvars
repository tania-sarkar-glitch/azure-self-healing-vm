environment = "test"

resource_group_name = "rg-platform-test"

location = "westus"

hub_vnet_name = "vnet-hub-test"

hub_address_space = [
  "10.10.0.0/16"
]

gateway_subnet_prefix = "10.10.0.0/24"

shared_services_subnet_prefix = "10.10.1.0/24"

spoke_vnet_name = "vnet-spoke-test"

spoke_address_space = [
  "10.11.0.0/16"
]

workload_subnet_name = "snet-workload-test"

workload_subnet_prefix = "10.11.1.0/24"