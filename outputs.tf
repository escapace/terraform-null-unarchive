output "path" {
  value       = abspath("${path.module}/archives/${local.hash}")
  description = "Extracted archive path"
  depends_on  = [null_resource.archive]
}
