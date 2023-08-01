terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-west-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  key_name = "debian-import"

  tags = {
    Name = "Akhilesh-DevOps-batch-server"
    env = "Production"
    owner = "Akhilesh Khanna"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

