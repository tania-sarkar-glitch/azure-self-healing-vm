####################################################
# Environment
####################################################

environment = "dev"

####################################################
# Resource Group
####################################################

resource_group_name = "rg-platform-dev"

location = "westus"

####################################################
# Hub Network
####################################################

hub_vnet_name = "vnet-hub-dev"

hub_address_space = [
  "10.0.0.0/16"
]

gateway_subnet_prefix = "10.0.0.0/24"

shared_services_subnet_prefix = "10.0.1.0/24"

####################################################
# Spoke Network
####################################################

spoke_vnet_name = "vnet-spoke-dev"

spoke_address_space = [
  "10.1.0.0/16"
]

workload_subnet_name = "snet-workload-dev"

workload_subnet_prefix = "10.1.1.0/24"