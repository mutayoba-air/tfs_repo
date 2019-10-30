provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
}

variable "region" {
  description = "Target region"
  default = "us-east-1"
}

variable "profile" {
    description = "The profile you want to use"
    default     = "default"
}

resource "aws_instance" "example" {
  ami = "ami-0b898040803850657"
  instance_type = "t2.micro"
}
