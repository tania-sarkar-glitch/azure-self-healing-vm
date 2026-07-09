module "hub_network" {
  source = "./modules/hub-network"

  # values added later
}

module "spoke_network" {
  source = "./modules/spoke-network"

  # values added later
}

module "vnet_peering" {
  source = "./modules/vnet-peering"

  # values added later
}