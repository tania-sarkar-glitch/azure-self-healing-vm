output "private_dns_zone_id" {
  description = "Private DNS Zone ID"

  value = azurerm_private_dns_zone.this.id
}

output "private_dns_zone_name" {
  description = "Private DNS Zone Name"

  value = azurerm_private_dns_zone.this.name
}