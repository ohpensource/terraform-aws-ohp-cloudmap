module "ns" {
  source   = "git@bitbucket.org:ohpen-dev/terraform-aws-ohp-cloudmap//modules/http_namespace.git?ref=v0.1.0"
  for_each = var.client_map

  platform                        = "ns"
  prefix                          = var.prefix
  client                          = each.key
  project                         = var.project
  envs                            = local.map_order[each.key]
  services                        = var.services_ns
  default_tags                    = local.default_tags
  client_map                      = each.value
  hierarchy_namespaces_service_id = aws_service_discovery_service.namespaces.id
  hierarchy_services_service_id   = aws_service_discovery_service.services.id
}
