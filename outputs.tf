output "branch_policy_build_validations_id" {
  description = "Map of id values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => v.id }
}
output "branch_policy_build_validations_blocking" {
  description = "Map of blocking values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => v.blocking }
}
output "branch_policy_build_validations_enabled" {
  description = "Map of enabled values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => v.enabled }
}
output "branch_policy_build_validations_project_id" {
  description = "Map of project_id values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => v.project_id }
}
output "branch_policy_build_validations_settings" {
  description = "Map of settings values across all branch_policy_build_validations, keyed the same as var.branch_policy_build_validations"
  value       = { for k, v in azuredevops_branch_policy_build_validation.branch_policy_build_validations : k => one(v.settings) }
}

