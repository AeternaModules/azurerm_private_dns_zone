output "private_dns_zones_max_number_of_record_sets" {
  description = "Map of max_number_of_record_sets values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.max_number_of_record_sets }
}
output "private_dns_zones_max_number_of_virtual_network_links" {
  description = "Map of max_number_of_virtual_network_links values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.max_number_of_virtual_network_links }
}
output "private_dns_zones_max_number_of_virtual_network_links_with_registration" {
  description = "Map of max_number_of_virtual_network_links_with_registration values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.max_number_of_virtual_network_links_with_registration }
}
output "private_dns_zones_name" {
  description = "Map of name values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.name }
}
output "private_dns_zones_number_of_record_sets" {
  description = "Map of number_of_record_sets values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.number_of_record_sets }
}
output "private_dns_zones_resource_group_name" {
  description = "Map of resource_group_name values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.resource_group_name }
}
output "private_dns_zones_soa_record" {
  description = "Map of soa_record values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.soa_record }
}
output "private_dns_zones_tags" {
  description = "Map of tags values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.tags }
}

