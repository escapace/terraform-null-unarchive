module "example" {
  source        = "../"
  archive       = "${path.module}/license.tgz"
}

output "test" {
  value       = module.example.path
  description = "Path"
}
