resource "aws_service_discovery_http_namespace" "main" {
  count       = length(var.envs)
  name        = "${var.client}${var.envs[count.index]}-${var.platform}"
  description = "Namespace ${upper(var.client)} ${upper(var.envs[count.index])} ${upper(var.platform)}"

  tags = merge(var.default_tags,
    tomap({
      "Name"      = "${var.client}${var.envs[count.index]}-${var.platform}",
      "Workspace" = lower(terraform.workspace),
      "Platform"  = var.platform,
      "Client"    = var.client,
      "Dtap"      = var.envs[count.index]
  }))
}

module "services" {
  source = "../service"
  count  = length(var.envs)

  services                      = var.services
  namespace_id                  = aws_service_discovery_http_namespace.main.*.id[count.index]
  namespace_arn                 = aws_service_discovery_http_namespace.main.*.arn[count.index]
  dtap                          = var.envs[count.index]
  client                        = var.client
  platform                      = var.platform
  default_tags                  = var.default_tags
  project                       = var.project
  prefix                        = var.prefix
  account_ids                   = var.client_map[var.envs[count.index]][var.platform]
  hierarchy_services_service_id = var.hierarchy_services_service_id
}

# resource "aws_cloudformation_stack" "hierarchy_namespaces" {
#   count         = length(var.envs)
#   name          = "cloudmap-tfm-${var.client}-${var.platform}-${var.envs[count.index]}"
#   template_body = <<-STACK
#   Resources:
#     HierachyInstance:
#       Type: AWS::ServiceDiscovery::Instance
#       Properties:
#         InstanceAttributes:
#           NamespaceName: "${var.client}-${var.platform}-${var.envs[count.index]}"
#           NamespaceId: "${aws_service_discovery_http_namespace.main.*.id[count.index]}"
#           Client: "${var.client}"
#           Dtap: "${var.envs[count.index]}"
#           Platform: "${var.platform}"
#         InstanceId: "${var.client}-${var.platform}-${var.envs[count.index]}"
#         ServiceId: "${var.hierarchy_namespaces_service_id}"
#   STACK
# }
