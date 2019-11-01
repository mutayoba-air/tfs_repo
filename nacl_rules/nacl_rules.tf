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

resource "aws_network_acl" "bar" {
  vpc_id = "${aws_vpc.test_vpc.id}"
}

resource "aws_network_acl_rule" "barA" {
  network_acl_id = "${aws_network_acl.bar.id}"
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_block = "10.0.1.0/24" # add a CIDR block here
  from_port  = 22
  to_port    = 22
}

resource "aws_network_acl_rule" "barB" {
  network_acl_id = "${aws_network_acl.bar.id}"
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_block = "10.0.2.0/24" # add a CIDR block here
  from_port  = 22
  to_port    = 22
}

resource "aws_network_acl_rule" "barC" {
  network_acl_id = "${aws_network_acl.bar.id}"
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_block = "10.0.3.0/24" # add a CIDR block here
  from_port  = 22
  to_port    = 22
}

resource "aws_network_acl_rule" "barD" {
  network_acl_id = "${aws_network_acl.bar.id}"
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_block = "10.0.4.0/24" # add a CIDR block here
  from_port  = 22
  to_port    = 22
}
