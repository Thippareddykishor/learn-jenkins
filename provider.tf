terraform {
  backend "s3" {
    bucket = "raws-devops-b78"
    key = "tools/jenkins"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}