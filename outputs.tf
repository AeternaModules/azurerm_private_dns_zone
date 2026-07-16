output "private_dns_zones_id" {
  description = "Map of id values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.id if v.id != null && length(v.id) > 0 }
}
output "private_dns_zones_max_number_of_record_sets" {
  description = "Map of max_number_of_record_sets values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.max_number_of_record_sets if v.max_number_of_record_sets != null }
}
output "private_dns_zones_max_number_of_virtual_network_links" {
  description = "Map of max_number_of_virtual_network_links values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.max_number_of_virtual_network_links if v.max_number_of_virtual_network_links != null }
}
output "private_dns_zones_max_number_of_virtual_network_links_with_registration" {
  description = "Map of max_number_of_virtual_network_links_with_registration values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.max_number_of_virtual_network_links_with_registration if v.max_number_of_virtual_network_links_with_registration != null }
}
output "private_dns_zones_name" {
  description = "Map of name values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.name if v.name != null && length(v.name) > 0 }
}
output "private_dns_zones_number_of_record_sets" {
  description = "Map of number_of_record_sets values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.number_of_record_sets if v.number_of_record_sets != null }
}
output "private_dns_zones_resource_group_name" {
  description = "Map of resource_group_name values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "private_dns_zones_soa_record" {
  description = "Map of soa_record values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.soa_record if v.soa_record != null && length(v.soa_record) > 0 }
}
output "private_dns_zones_tags" {
  description = "Map of tags values across all private_dns_zones, keyed the same as var.private_dns_zones"
  value       = { for k, v in azurerm_private_dns_zone.private_dns_zones : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

