output "notification_hubs_id" {
  description = "Map of id values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "notification_hubs_apns_credential" {
  description = "Map of apns_credential values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.apns_credential if v.apns_credential != null && length(v.apns_credential) > 0 }
  sensitive   = true
}
output "notification_hubs_browser_credential" {
  description = "Map of browser_credential values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.browser_credential if v.browser_credential != null && length(v.browser_credential) > 0 }
  sensitive   = true
}
output "notification_hubs_gcm_credential" {
  description = "Map of gcm_credential values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.gcm_credential if v.gcm_credential != null && length(v.gcm_credential) > 0 }
  sensitive   = true
}
output "notification_hubs_location" {
  description = "Map of location values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.location if v.location != null && length(v.location) > 0 }
}
output "notification_hubs_name" {
  description = "Map of name values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "notification_hubs_namespace_name" {
  description = "Map of namespace_name values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.namespace_name if v.namespace_name != null && length(v.namespace_name) > 0 }
}
output "notification_hubs_resource_group_name" {
  description = "Map of resource_group_name values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "notification_hubs_tags" {
  description = "Map of tags values across all notification_hubs, keyed the same as var.notification_hubs"
  value       = { for k, v in azurerm_notification_hub.notification_hubs : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

