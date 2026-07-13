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
  validation {
    condition = alltrue([
      for k, v in var.notification_hubs : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.notification_hubs : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.notification_hubs : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.notification_hubs : (
        v.browser_credential == null || (length(v.browser_credential.subject) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.notification_hubs : (
        v.browser_credential == null || (length(v.browser_credential.vapid_private_key) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.notification_hubs : (
        v.browser_credential == null || (length(v.browser_credential.vapid_public_key) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.notification_hubs : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

