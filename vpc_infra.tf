provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
}

variable "region" {
  description = "Target region"
  default     = "us-east-1"
}

variable "profile" {
  description = "The profile you want to use"
  default     = "default"
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
  tags {
    Name = "test VPC"
  }
}
