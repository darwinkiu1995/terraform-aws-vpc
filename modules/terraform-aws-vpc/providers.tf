
#Set region
 provider "aws" {
  region  = var.region
}





# Create  Subnet
 resource "aws_subnet" "custom" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnets_cidr
  availability_zone = "ap-east-1a"
  
  tags = {
    Name = "${var.env}-${var.subnet_type}"
    Env  = var.env
  }
}




# Create Route to NAT Gateway if the value of route is internet
resource "aws_route_table_association" "internet_gateway_route" {
  count = "${var.route == "internet" ? 1 : 0}" 
  subnet_id      = aws_subnet.custom.id
  route_table_id = var.route_table_id
}





# Create Route to NAT Gateway if the value of route is nat 
resource "aws_route_table_association" "nat_gateway_route" {
  count = "${var.route == "nat" ? 1 : 0}"
  subnet_id      = aws_subnet.custom.id
  route_table_id = var.route_table_id
}







