output "branch_policy_build_validations_id" {
  description = "Map of id values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations except keys with no id are omitted"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "branch_policy_build_validations_blocking" {
  description = "Map of blocking values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations except keys with no blocking are omitted"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => v.blocking if v.blocking != null }
}
output "branch_policy_build_validations_enabled" {
  description = "Map of enabled values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations except keys with no enabled are omitted"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => v.enabled if v.enabled != null }
}
output "branch_policy_build_validations_project_id" {
  description = "Map of project_id values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations except keys with no project_id are omitted"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "branch_policy_build_validations_settings" {
  description = "Map of settings values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations except keys with no settings are omitted"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => one(v.settings) if v.settings != null && length(v.settings) > 0 }
}

