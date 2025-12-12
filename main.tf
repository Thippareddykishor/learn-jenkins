module "ec2" {
  for_each = var.instances  
  source = "./tools/ec2-mod"
  instance_type = each.value.instance_type
  name = each.key 
  ami = each.value.ami
  vpc_security_group_ids = ["sg-039813d39262650f5"]
}

variable "instances" {}