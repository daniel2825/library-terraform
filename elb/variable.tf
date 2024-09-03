variable "subnet_public_id" {
 type = string
 description = "Network address subnet public"
}

variable vpc_id {
    type = string
    description = "Vpc Id"
}

variable "subnet_private_id" {
 type = string
 description = "Network address subnet private"
}

variable "security_group_public_id" {
 type = string
 description = "Security group public id"
}

variable "security_group_private_id" {
 type = string
 description = "Security group private id"
}

variable "instance_type_autoscaling" {
  type        = string
  description = "value"
}

variable "ami_autoscaling" {
  type        = string
  description = "value"
}

variable "key_name_instances" {
  type = string
  description = "value"
}

variable "percentage_cpu_scaling" {
  type        = number
  description = "value"
}