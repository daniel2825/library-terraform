variable "vpc_id" {
 type = string
 description = "Id of vpc"
}

variable "internet_gateway_id" {
 type = string
 description = "Internet gateway id"
}

variable "subnet_public_id" {
 type = string
 description = "Network address subnet public"
}

variable "subnet_private_id" {
 type = string
 description = "Network address subnet private"
}