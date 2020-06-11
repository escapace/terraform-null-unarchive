locals {
  archive  = "${var.archive}"
  archiver = "${path.module}/bin/archiver"
  hash     = filesha256(local.archive)
}

resource "random_pet" "folder" {
  keepers = {
    hash    = local.hash
    archive = local.archive
  }
}

resource "null_resource" "archive" {
  triggers = {
    hash    = local.hash
    archive = local.archive
    path    = "${path.module}/archives/${random_pet.folder.id}"
  }

  provisioner "local-exec" {
    command = "mkdir -p \"${path.module}/archives/${random_pet.folder.id}\" && \"${local.archiver}\" unarchive \"${local.archive}\" \"${path.module}/archives/${random_pet.folder.id}\""
  }
}

data "null_data_source" "archive" {
  inputs = {
    path = abspath("${path.module}/archives/${random_pet.folder.id}")
  }

  depends_on = [null_resource.archive]
}
