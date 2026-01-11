variable "notification_hubs" {
  description = <<EOT
Map of notification_hubs, attributes below
Required:
    - location
    - name
    - namespace_name
    - resource_group_name
Optional:
    - tags
    - apns_credential (block):
        - application_mode (required)
        - bundle_id (required)
        - key_id (required)
        - team_id (required)
        - token (required)
    - browser_credential (block):
        - subject (required)
        - vapid_private_key (required)
        - vapid_public_key (required)
    - gcm_credential (block):
        - api_key (required)
EOT

  type = map(object({
    location            = string
    name                = string
    namespace_name      = string
    resource_group_name = string
    tags                = optional(map(string))
    apns_credential = optional(object({
      application_mode = string
      bundle_id        = string
      key_id           = string
      team_id          = string
      token            = string
    }))
    browser_credential = optional(object({
      subject           = string
      vapid_private_key = string
      vapid_public_key  = string
    }))
    gcm_credential = optional(object({
      api_key = string
    }))
  }))
}

