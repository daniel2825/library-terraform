resource "aws_instance" "libraryBastionHost" {

  ami                         = var.ami_bastion_host
  instance_type               = var.instance_type_bastion_host
  subnet_id                   = var.subnet_public_id
  security_groups             = [var.security_group_public_id]
  associate_public_ip_address = true
  key_name                    = var.key_name_instances
  
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp3"
    volume_size = 14
    iops        = 500
  }


  tags = {
    Name = "Bastion host"
  }

}

resource "aws_instance" "libraryServerWeb" {

  ami                         = var.ami_server
  instance_type               = var.instance_type_server
  subnet_id                   = var.subnet_private_id
  security_groups             = [var.security_group_private_id]
  associate_public_ip_address = false

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp3"
    volume_size = 14
    iops        = 500
  }
  key_name = var.key_name_instances
  tags = {
    Name = "Library Server Web"
  }

}