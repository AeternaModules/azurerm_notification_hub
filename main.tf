resource "azurerm_notification_hub" "notification_hubs" {
  for_each = var.notification_hubs

  location            = each.value.location
  name                = each.value.name
  namespace_name      = each.value.namespace_name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "apns_credential" {
    for_each = each.value.apns_credential != null ? [each.value.apns_credential] : []
    content {
      application_mode = apns_credential.value.application_mode
      bundle_id        = apns_credential.value.bundle_id
      key_id           = apns_credential.value.key_id
      team_id          = apns_credential.value.team_id
      token            = apns_credential.value.token
    }
  }

  dynamic "browser_credential" {
    for_each = each.value.browser_credential != null ? [each.value.browser_credential] : []
    content {
      subject           = browser_credential.value.subject
      vapid_private_key = browser_credential.value.vapid_private_key
      vapid_public_key  = browser_credential.value.vapid_public_key
    }
  }

  dynamic "gcm_credential" {
    for_each = each.value.gcm_credential != null ? [each.value.gcm_credential] : []
    content {
      api_key = gcm_credential.value.api_key
    }
  }
}

