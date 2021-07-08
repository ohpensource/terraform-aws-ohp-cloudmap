###########################
# Example instance
module "ohp_instance_bulk" {
  source = "git@bitbucket.org:ohpen-dev/terraform-aws-ohp-cloudmap.git//modules//instance?ref=v0.4.0"

  name       = var.instance_name
  service_id = data.aws_ssm_parameter.bulk.value
  attributes = var.instance_attributes
}

data "aws_ssm_parameter" "bulk" {
  name = "/cloudmap/ohp-dev-ns/bulk/serviceid"
}

variable "instance_attributes" {
  type = map(any)
  default = {
    version = "1.0"
    url     = "https://test.example.com"
  }
}

variable "instance_name" {
  type    = string
  default = "bulk"
}
