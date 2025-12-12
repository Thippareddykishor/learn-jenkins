resource "aws_instance" "tool" {
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.tool.id]
  ami = var.ami_id

  tags = {
    Name = var.name
  }
  instance_market_options {
    market_type = "spot"
  }
}



data "aws_route53_zone" "get_zoneId" {
  name = "kommanuthala.store"

}

resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.get_zoneId.id
  type="A"
  ttl = 10
  records= [aws_instance.tool.public_ip]
  name = "${var.name}"
}

resource "aws_security_group" "tool" {
  name = "${var.name}-sg"
  vpc_id = "vpc-0a3866008be6589a6"

  tags = {
    Name= "allow_all"
    createdBy="terraform"
  }
}

resource "aws_vpc_security_group_egress_rule" "engress" {
  security_group_id = aws_security_group.tool.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.tool.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "tool_port" {
  security_group_id = aws_security_group.tool.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = var.port
  to_port = var.port
  ip_protocol = "tcp"
}