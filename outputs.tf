output "notification_hubs" {
  description = "All notification_hub resources"
  value       = azurerm_notification_hub.notification_hubs
  sensitive   = true
}
output "notification_hubs_apns_credential" {
  description = "List of apns_credential values across all notification_hubs"
  value       = [for k, v in azurerm_notification_hub.notification_hubs : v.apns_credential]
  sensitive   = true
}
output "notification_hubs_browser_credential" {
  description = "List of browser_credential values across all notification_hubs"
  value       = [for k, v in azurerm_notification_hub.notification_hubs : v.browser_credential]
  sensitive   = true
}
output "notification_hubs_gcm_credential" {
  description = "List of gcm_credential values across all notification_hubs"
  value       = [for k, v in azurerm_notification_hub.notification_hubs : v.gcm_credential]
  sensitive   = true
}
output "notification_hubs_location" {
  description = "List of location values across all notification_hubs"
  value       = [for k, v in azurerm_notification_hub.notification_hubs : v.location]
}
output "notification_hubs_name" {
  description = "List of name values across all notification_hubs"
  value       = [for k, v in azurerm_notification_hub.notification_hubs : v.name]
}
output "notification_hubs_namespace_name" {
  description = "List of namespace_name values across all notification_hubs"
  value       = [for k, v in azurerm_notification_hub.notification_hubs : v.namespace_name]
}
output "notification_hubs_resource_group_name" {
  description = "List of resource_group_name values across all notification_hubs"
  value       = [for k, v in azurerm_notification_hub.notification_hubs : v.resource_group_name]
}
output "notification_hubs_tags" {
  description = "List of tags values across all notification_hubs"
  value       = [for k, v in azurerm_notification_hub.notification_hubs : v.tags]
}

