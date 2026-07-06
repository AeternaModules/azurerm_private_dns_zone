output "private_dns_zones" {
  description = "All private_dns_zone resources"
  value       = azurerm_private_dns_zone.private_dns_zones
}
output "private_dns_zones_max_number_of_record_sets" {
  description = "List of max_number_of_record_sets values across all private_dns_zones"
  value       = [for k, v in azurerm_private_dns_zone.private_dns_zones : v.max_number_of_record_sets]
}
output "private_dns_zones_max_number_of_virtual_network_links" {
  description = "List of max_number_of_virtual_network_links values across all private_dns_zones"
  value       = [for k, v in azurerm_private_dns_zone.private_dns_zones : v.max_number_of_virtual_network_links]
}
output "private_dns_zones_max_number_of_virtual_network_links_with_registration" {
  description = "List of max_number_of_virtual_network_links_with_registration values across all private_dns_zones"
  value       = [for k, v in azurerm_private_dns_zone.private_dns_zones : v.max_number_of_virtual_network_links_with_registration]
}
output "private_dns_zones_name" {
  description = "List of name values across all private_dns_zones"
  value       = [for k, v in azurerm_private_dns_zone.private_dns_zones : v.name]
}
output "private_dns_zones_number_of_record_sets" {
  description = "List of number_of_record_sets values across all private_dns_zones"
  value       = [for k, v in azurerm_private_dns_zone.private_dns_zones : v.number_of_record_sets]
}
output "private_dns_zones_resource_group_name" {
  description = "List of resource_group_name values across all private_dns_zones"
  value       = [for k, v in azurerm_private_dns_zone.private_dns_zones : v.resource_group_name]
}
output "private_dns_zones_soa_record" {
  description = "List of soa_record values across all private_dns_zones"
  value       = [for k, v in azurerm_private_dns_zone.private_dns_zones : v.soa_record]
}
output "private_dns_zones_tags" {
  description = "List of tags values across all private_dns_zones"
  value       = [for k, v in azurerm_private_dns_zone.private_dns_zones : v.tags]
}

