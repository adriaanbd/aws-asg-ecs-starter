resource "aws_instance" "bastion_a" {
  ami                    = var.ami_linux_2_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.pub_sub_a_id
  vpc_security_group_ids = [var.bastion_sg]
  tags = {
    Name        = "${var.namespace}-bastion_a"
    Environemnt = "dev"
  }
}

