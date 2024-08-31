resource "aws_network_acl" "networkAclPrivateLibrary" {
  vpc_id = var.vpc_id

  subnet_ids = [var.subnet_private_id]

  ingress {
    protocol   = "tcp"
    rule_no    = 54
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 96
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 3000
    to_port    = 3000
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 86
    action     = "allow"
    cidr_block = "10.0.0.128/25"
    from_port  = 22
    to_port    = 22
  }

  //https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
  //https://docs.aws.amazon.com/es_es/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-network-acl-entry.html
  //https://www.ibm.com/support/knowledgecenter/SS42VS_7.3.3/com.ibm.qradar.doc/c_DefAppCfg_guide_ICMP_intro.html
  /*ingress {
    protocol   = 1
    rule_no    = 98
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = -1
    to_port    = -1
    icmp_code  = -1
    icmp_type  = -1
  }*/

  egress {
    protocol   = "tcp"
    rule_no    = 54
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "tcp"
    rule_no    = 96
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 3000
    to_port    = 3000
  }

  egress {
    protocol   = "tcp"
    rule_no    = 18
    action     = "allow"
    cidr_block = "11.0.0.128/25"
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = "tcp"
    rule_no    = 21
    action     = "allow"
    cidr_block = "11.0.0.128/25"
    from_port  = 0
    to_port    = 65535
  }

  egress {
    protocol   = "icmp"
    rule_no    = 98
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
    icmp_code  = -1
    icmp_type  = -1
  }

  tags = {
    Name = "networkAclPrivateLibrary"
  }
}
