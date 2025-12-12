terraform {
  backend "s3" {
    bucket = "raws-devops-b78"
    key = "jenkins"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "tools" {
  default = {
    jenkins ={
        instance_type= "t3.micro"
        port =8080
        
    }
    jenkins_agent={
        instance_type="t3.small"
        port=8080
    }
  }
}

module "ec2" {
  source = "./ec2"
  for_each = var.tools
  ami_id = var.ami_id
  instance_type = each.value.instance_type
  port = each.value.port
  name = each.key
}

variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}
