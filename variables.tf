variable "cidr_block" {
  type        = string
  description = "Network address"
}

variable "cidr_block_subnet_public" {
  type        = string
  description = "Network address subnet public"
}

variable "cidr_block_subnet_private" {
  type        = string
  description = "Network address subnet public"
}

variable "availability_zone_public_subnet" {
  type        = string
  description = "Availability zone public subnet"
}

variable "availability_zone_private_subnet" {
  type        = string
  description = "Availability zone private subnet"
}

variable "ami_bastion_host" {
  type        = string
  description = "ami bastion host"
}

variable "ami_server" {
  type        = string
  description = "value"
}

variable "ami_autoscaling" {
  type        = string
  description = "value"
}

variable "key_name_instances" {
  type        = string
  description = "value"
}

variable "instance_type_bastion_host" {
  type        = string
  description = "value"
}

variable "instance_type_server" {
  type        = string
  description = "value"
}

variable "instance_type_autoscaling" {
  type        = string
  description = "value"
}

variable "percentage_cpu_scaling" {
  type        = number
  description = "value"
}

