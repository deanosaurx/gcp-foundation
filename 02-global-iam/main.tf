data "tfe_outputs" "bootstrap" {
  organization = var.tfc_organization
  workspace    = "00-tfc-bootstrap"
}

data "tfe_outputs" "admin" {
  organization = var.tfc_organization
  workspace    = "01-cloud-administration-global"
}

module "organization-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.1"
  organizations = [var.org_id]
  mode          = "additive"

  bindings             = var.org_bindings
  conditional_bindings = var.org_conditional_bindings
}

module "folder-iam-bindings" {
  for_each             = var.folders_iam
  source               = "terraform-google-modules/iam/google//modules/folders_iam"
  version              = "~> 7.4.1"
  folders              = [data.tfe_outputs.bootstrap.values.folders[each.key].folder_id]
  bindings             = each.value.bindings
  conditional_bindings = var.folders_iam[each.key].conditional_bindings
  mode                 = "additive"
}

module "audit-iam-bindings" {
  source               = "terraform-google-modules/iam/google//modules/projects_iam"
  version              = "~> 7.4.1"
  projects             = [data.tfe_outputs.admin.values.projects["central-audit-logging"].project_id]
  bindings             = var.audit_bindings
  conditional_bindings = var.audit_conditional_bindings
  mode                 = "additive"
}

module "cloud-billing-iam-bindings" {
  source               = "terraform-google-modules/iam/google//modules/projects_iam"
  version              = "~> 7.4.1"
  projects             = [data.tfe_outputs.admin.values.projects["kyndean-bill-logs"].project_id]
  bindings             = var.billing_project_bindings
  conditional_bindings = var.billing_project_conditional_bindings
  mode                 = "additive"
}