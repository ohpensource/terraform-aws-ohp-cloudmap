output "arns" {
  value = [for s in module.services : s.arn]
}

output "ids" {
  value = [for s in module.services : s.id]
}

output "services" {
  value = module.services
}
