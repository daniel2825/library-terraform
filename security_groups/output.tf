output "security_group_public_id"{
    value = aws_security_group.securegroupPublic.id
}

output "security_group_private_id"{
    value = aws_security_group.securegroupPrivadte.id
}