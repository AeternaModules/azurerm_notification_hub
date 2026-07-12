output "notification_hubs_id" {
  description = "Map of id values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.id }
}
output "notification_hubs_apns_credential" {
  description = "Map of apns_credential values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.apns_credential }
  sensitive   = true
}
output "notification_hubs_browser_credential" {
  description = "Map of browser_credential values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.browser_credential }
  sensitive   = true
}
output "notification_hubs_gcm_credential" {
  description = "Map of gcm_credential values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.gcm_credential }
  sensitive   = true
}
output "notification_hubs_location" {
  description = "Map of location values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.location }
}
output "notification_hubs_name" {
  description = "Map of name values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.name }
}
output "notification_hubs_namespace_name" {
  description = "Map of namespace_name values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.namespace_name }
}
output "notification_hubs_resource_group_name" {
  description = "Map of resource_group_name values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.resource_group_name }
}
output "notification_hubs_tags" {
  description = "Map of tags values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.tags }
}

