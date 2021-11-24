###########################
# Read-only IAM role for all namespaces, services, instances from all accounts
module "iam_ro_role" {
  source = "github.com/ohpensource/terraform-aws-ohp-cloudmap//modules//iam_ro_role?ref=v0.0.1"

  name        = "cloudmap-ro-role"
  account_ids = local.all_account_ids
  tags        = var.tags
}

locals {
  ohp_account_ids = distinct(flatten([for i in keys(local.namespace_info_ohp) : [for a in local.namespace_info_ohp[i].account_ids : a]]))
  tkp_account_ids = distinct(flatten([for i in keys(local.namespace_info_tkp) : [for a in local.namespace_info_tkp[i].account_ids : a]]))
  all_account_ids = distinct(concat(local.ohp_account_ids, local.tkp_account_ids))

}

###########################
# OHP Dev Namespace & Services
module "namespace_ohp_dev" {
  source = "./modules/cloudmap"

  namespace_prefix          = "ohp-dev"
  account_ids               = local.namespace_info_ohp.dev.account_ids
  services                  = local.namespace_info_ohp.dev.services
  create_namespace_iam_role = local.namespace_info_ohp.dev.create_namespace_iam_role
  create_service_iam_role   = local.namespace_info_ohp.dev.create_service_iam_role
  tags                      = var.tags
}
