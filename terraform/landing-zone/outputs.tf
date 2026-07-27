output "resource_group_name" {
  description = "Landing Zone Resource Group"

  value = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "Landing Zone Resource Group ID"

  value = module.resource_group.resource_group_id
}

output "hub_vnet_name" {
  description = "Hub Virtual Network name"

  value = module.hub_network.hub_vnet_name
}

output "hub_vnet_id" {
  description = "Hub Virtual Network ID"

  value = module.hub_network.hub_vnet_id
}

output "spoke_vnet_name" {
  description = "Spoke Virtual Network name"

  value = module.spoke_network.spoke_vnet_name
}

output "spoke_vnet_id" {
  description = "Spoke Virtual Network ID"

  value = module.spoke_network.spoke_vnet_id
}

output "hub_to_spoke_peering_id" {
  description = "Hub to Spoke peering ID"

  value = module.vnet_peering.hub_to_spoke_peering_id
}

output "spoke_to_hub_peering_id" {
  description = "Spoke to Hub peering ID"

  value = module.vnet_peering.spoke_to_hub_peering_id
}

output "private_dns_zone_id" {

  value = module.private_dns.private_dns_zone_id

}

output "private_dns_zone_name" {

  value = module.private_dns.private_dns_zone_name

}