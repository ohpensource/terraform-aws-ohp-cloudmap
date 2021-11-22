module "namespace" {
  source = "git@bitbucket.org:ohpen-dev/terraform-aws-ohp-cloudmap.git//modules//http_namespace?ref=v0.4.0"

  for_each           = local.namespace_services[0]
  name               = each.key
  description        = upper(each.key)
  create_iam_rw_role = var.create_namespace_iam_role
  account_ids        = var.account_ids
  tags               = var.tags

}

module "services" {
  source = "git@bitbucket.org:ohpen-dev/terraform-aws-ohp-cloudmap.git//modules//service?ref=v0.4.0"

  for_each = local.namespace_services[0]

  namespace_id            = module.namespace[each.key].id
  namespace_name          = each.key
  account_ids             = sort(var.account_ids)
  namespace_role_name     = module.namespace[each.key].role_name
  create_service_iam_role = var.create_service_iam_role
  services                = each.value
  tags                    = var.tags
}

variable "namespace_prefix" {
  default = null
}

variable "services" {
  type    = map(any)
  default = {}
}

variable "create_namespace_iam_role" {
  type    = bool
  default = false
}

variable "create_service_iam_role" {
  type    = bool
  default = false
}

variable "account_ids" {
  type    = list(any)
  default = []
}

variable "tags" {
  type    = map(any)
  default = {}
}
