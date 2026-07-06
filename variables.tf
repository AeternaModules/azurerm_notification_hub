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
  # --- Unconfirmed validation candidates, derived from azurerm_notification_hub's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: apns_credential.application_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

