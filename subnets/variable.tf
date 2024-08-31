variable "vpc_id" {
 type = string
 description = "Id of vpc"
}

variable "internet_gateway_id" {
 type = string
 description = "Id of gateway"
}

variable "cidr_block_subnet_public" {
 type = string
 description = "Network address subnet public"
}

variable "cidr_block_subnet_private" {
 type = string
 description = "Network address subnet private"
}

variable "availability_zone_public_subnet" {
 type = string
 description = "Availability zone public subnet"
}

variable "availability_zone_private_subnet" {
 type = string
 description = "Availability zone public subnet" 
}


