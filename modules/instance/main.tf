resource "aws_cloudformation_stack" "main" {
  name = var.name
  template_body = jsonencode({
    Resources : {
      Instance : {
        Type : "AWS::ServiceDiscovery::Instance",
        Properties : {
          InstanceAttributes : "${var.attributes}",
          InstanceId : "${var.name}",
          ServiceId : "${var.service_id}"
  } } } })
}

