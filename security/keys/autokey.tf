locals {
  is_windows = substr(pathexpand("~"), 0, 1) == "/" ? false : true
  key_file   = pathexpand("~/.ssh/${var.ssh_key_name}.pem")
}

locals {
  bash       = "chmod 400 ${local.key_file}"
  powershell = "icacls ${local.key_file} /inheritancelevel:r /grant:r ${var.os_username}:R"
}

resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.ssh_key_name
  public_key = tls_private_key.rsa_key.public_key_openssh
}

resource "local_file" "my_key_file" {
  content     = tls_private_key.rsa_key.private_key_pem
  filename    = local.key_file

  provisioner "local-exec" {
    command = local.is_windows ? local.powershell : local.bash
  }
}