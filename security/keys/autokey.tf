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
  filename    = pathexpand("~/.ssh/${var.ssh_key_name}.pem")

  provisioner "local-exec" {
    command = "chmod 400 ${local_file.my_key_file.filename}"
  }

  provisioner "local-exec" {
    command = "icacls ${local_file.my_key_file.filename} /inheritance:r & icacls ${local_file.my_key_file.filename} /grant:r \"%username%\":\"(R)\""
  }
}