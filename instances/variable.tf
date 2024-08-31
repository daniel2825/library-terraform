variable "subnet_public_id" {
 type = string
 description = "subnet id public"
}

variable "security_group_public_id" {
 type = string
 description = "security group id public"
}

variable "subnet_private_id" {
 type = string
 description = "subnet id private"
}

variable "security_group_private_id" {
 type = string
 description = "security group id private"
}

variable "ami_bastion_host" {
  type = string
  description = "ami bastion host"
}

variable "ami_server" {
  type = string
  description = "value"
}

variable "key_name_instances" {
  type = string
  description = "value"
}

variable "instance_type_bastion_host" {
  type = string
  description = "value"
}

variable "instance_type_server" {
  type = string
  description = "value"
}