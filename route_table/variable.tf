variable "vpc_id" {
 type = string
 description = "Id of vpc"
}

variable "internet_gateway_id" {
 type = string
 description = "Internet gateway id"
}

variable "cidr_block_subnet_public" {
 type = string
 description = "Network address subnet public"
}

variable "cidr_block_subnet_private" {
 type = string
 description = "Network address subnet private"
}