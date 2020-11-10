resource "aws_instance" "bastion" {
  ami                    = var.ami_linux_2_id
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name

  count                  = length(var.pub_sub_ids)

  subnet_id              = var.pub_sub_ids[count.index]
  vpc_security_group_ids = [var.general_sg_id, var.bastion_sg_id]

  tags = {
    Name        = "${var.namespace}-bastion-${count.index + 1}"
    Environemnt = "dev"
  }
}
