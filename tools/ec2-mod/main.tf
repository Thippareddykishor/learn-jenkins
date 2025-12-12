resource "aws_instance" "ec2" {
  
  instance_type = var.instance_type
  ami = var.ami
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "${var.name}"
  }
}

data "aws_route53_zone" "get_zoneId" {
  name = "kommanuthala.store"
}

resource "aws_route53_record" "ec2" {

  type = "A"
  ttl = 10
  records = [aws_instance.ec2.private_ip]
  zone_id = data.aws_route53_zone.get_zoneId.id
  name = "${var.name}-internal"

}