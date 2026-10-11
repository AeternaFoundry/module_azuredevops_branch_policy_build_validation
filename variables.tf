variable "branch_policy_build_validations" {
  description = <<EOT
Map of branch_policy_build_validations, attributes below
Required:
    - project_id
    - settings (block):
        - build_definition_id (required)
        - display_name (required)
        - filename_patterns (optional)
        - manual_queue_only (optional)
        - queue_on_source_update_only (optional)
        - scope (required, block):
            - match_type (optional)
            - repository_id (optional)
            - repository_ref (optional)
        - valid_duration (optional)
Optional:
    - blocking
    - enabled
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    project_id = string
    blocking   = optional(bool)
    enabled    = optional(bool)
    settings = object({
      build_definition_id         = number
      display_name                = string
      filename_patterns           = optional(list(string))
      manual_queue_only           = optional(bool)
      queue_on_source_update_only = optional(bool)
      scope = list(object({
        match_type     = optional(string)
        repository_id  = optional(string)
        repository_ref = optional(string)
      }))
      valid_duration = optional(number)
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.branch_policy_build_validations : (
        length(v.settings.scope) >= 1
      )
    ])
    error_message = "Each scope list must contain at least 1 items"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

