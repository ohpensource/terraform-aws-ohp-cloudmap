module "namespace" {
  source = "github.com/ohpensource/terraform-aws-ohp-cloudmap//modules//http_namespace?ref=v0.0.1"

  name               = var.namespace_name
  description        = var.namespace_description
  create_iam_rw_role = var.create_namespace_iam_role
  account_ids        = var.account_ids
  tags               = var.tags

}

module "iam_ro_role" {
  source = "github.com/ohpensource/terraform-aws-ohp-cloudmap//modules//iam_ro_role?ref=v0.0.1"

  name        = "cloudmap-ro-role"
  account_ids = var.account_ids
  tags        = var.tags
}

module "funds_service" {
  source = "github.com/ohpensource/terraform-aws-ohp-cloudmap//modules//service?ref=v0.0.1"

  namespace_id            = module.namespace.id
  namespace_name          = var.namespace_name
  account_ids             = var.account_ids
  namespace_role_name     = module.namespace.role_name
  create_service_iam_role = var.create_service_iam_role
  service                 = var.services[0]
  tags                    = var.tags
}

module "instance_funds" {
  source = "github.com/ohpensource/terraform-aws-ohp-cloudmap//modules//instance?ref=v0.0.1"

  name       = var.instance_name
  service_id = module.funds_service.id
  attributes = var.instance_attributes
}
