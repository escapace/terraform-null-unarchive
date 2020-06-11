module "example" {
  source        = "../"
  archive       = "${path.module}/license.zip"
}

output "test" {
  value       = module.example.path
  description = "Path"
}
