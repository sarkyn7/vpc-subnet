terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
access_key = "AKIAW3MWNSX4CP7JZJHU"
secret_key = "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"
}


# creating VPC
resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 
 tags = {
   Name = "Project_vpc"
 }
}

# creating a subnet
resource "aws_subnet" "subbnet01" {
    vpc_id = aws_vpc.Project_vpc
    cidr_block = "10.0.0.0/24"  
}

resource "aws_subnet" "subbnet02" {
    vpc_id = aws_vpc.Project_vpc
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1"
    map_public_ip_on_launch = true  
}

# creating route table
resource "aws_route_table" "myroutetable" {
    vpc_id = aws_vpc.my
  
}