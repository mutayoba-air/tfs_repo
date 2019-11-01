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

  tags = {
    Name = "test_vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  tags = {
    Name = "main"
  }
}

resource "aws_egress_only_internet_gateway" "foo" {
  vpc_id = "${aws_vpc.test_vpc.id}"
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  route {
    cidr_block = "10.0.3.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  route {
    cidr_block = "10.0.4.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = "${aws_egress_only_internet_gateway.foo.id}"
  }

  tags = {
    Name = "test_main_router"
  }
}
