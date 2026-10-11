resource "azuredevops_branch_policy_build_validation" "branch_policy_build_validations" {
  for_each = var.branch_policy_build_validations

  project_id = each.value.project_id
  blocking   = each.value.blocking
  enabled    = each.value.enabled

  settings {
    build_definition_id         = each.value.settings.build_definition_id
    display_name                = each.value.settings.display_name
    filename_patterns           = each.value.settings.filename_patterns
    manual_queue_only           = each.value.settings.manual_queue_only
    queue_on_source_update_only = each.value.settings.queue_on_source_update_only
    dynamic "scope" {
      for_each = each.value.settings.scope
      content {
        match_type     = scope.value.match_type
        repository_id  = scope.value.repository_id
        repository_ref = scope.value.repository_ref
      }
    }
    valid_duration = each.value.settings.valid_duration
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

