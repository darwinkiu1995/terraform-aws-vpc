
# Create Internet Gateway
 resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.ownvpc.id

  tags = {
    Name = "${var.name}-igw"
    Env  = var.env
  }
}



# Create Route To Internet Gateway
 resource "aws_route_table" "my_table" {
  vpc_id = aws_vpc.ownvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygateway.id
  }
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
