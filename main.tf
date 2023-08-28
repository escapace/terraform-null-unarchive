locals {
  archive  = var.archive
  archiver = "${path.module}/bin/archiver"
  hash     = uuidv5("oid", filesha256(var.archive))
}

resource "null_resource" "archive" {
  triggers = {
    hash = local.hash
  }

  provisioner "local-exec" {
    command = "if [ ! -d \"${path.module}/archives/${local.hash}\" ]; then mkdir -p \"${path.module}/archives/${local.hash}\" && \"${local.archiver}\" unarchive \"${local.archive}\" \"${path.module}/archives/${local.hash}\"; fi"
  }
}
