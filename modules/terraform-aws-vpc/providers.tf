
#Set region
 provider "aws" {
  region  = var.region
}




# Create VPC
 resource "aws_vpc" "ownvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
   
  tags = {
    Name = var.name
    Env  = var.env
   } 
}



# Create Public Subnet
 resource "aws_subnet" "public" {
  count = "${var.subnet_type == "public" ? 1 : 0}"
  vpc_id     = aws_vpc.ownvpc.id
  cidr_block = var.subnets_cidr
  availability_zone = "ap-east-1a"
  
  tags = {
    Name = "${var.env}-${var.subnet_type}"
    Env  = var.env
  }
}



# Create Private Subnet
 resource "aws_subnet" "private" {
  count = "${var.subnet_type == "private" ? 1 : 0}"
  vpc_id     = aws_vpc.ownvpc.id
  cidr_block = var.subnets_cidr
  availability_zone = "ap-east-1a"

  tags = {
    Name = "${var.env}-${var.subnet_type}"
    Env  = var.env
  }
}



module "gateway_route" {
  count = "${var.route == "internet" ? 1 : 0}"
  source = "./internet_route"
    
    region               = "${var.regiom}"
    vpc_cidr             = var.vpc_cidr           
    name                 = var.name               
    env                  = var.env                
    subnets_cidr  		 = var.subnets_cidr  		
    availability_zones   = var.availability_zones 
    subnet_type 		 = var.subnet_type 		
    route 				 = var.route
}



# resource "aws_internet_gateway" "mygateway" {

#  vpc_id = aws_vpc.ownvpc.id

#  tags = {
#    Name = "${var.name}-${gateway}"
#    Env  = var.env
#  }
#}


# resource "aws_route_table" "my_table" {
#  vpc_id = aws_vpc.ownvpc.id


#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.mygateway.id
#  }


#}
# resource "aws_route_table_association" "rta_subnet_public" {
#  subnet_id      = aws_subnet.public.id
#  route_table_id = aws_route_table.my_table.id
# }
