output "subnet_public_id" {
    value = aws_subnet.subnetPublicLibrary.id
}

output "subnet_private_id" {
    value = aws_subnet.subnetPrivateLibrary
}