module "public-test" {

source = "./modules/terraform-aws-vpc"

  region               = "ap-east-1"
  vpc_id	       = "vpc-00b1628ca609d5dc2"
  name                 = "public-test"
  env                  = "public-test"
  subnets_cidr  = "172.31.0.0/24"
  availability_zones   = "ap-east-1a"
  subnet_type = "public"
  route = "internet"
  route_table_id = "rtb-07672bd3972032a38"
  gateway_id = "igw-08b0a16118512bb64"
}


module "private-test" {

source = "./modules/terraform-aws-vpc"

  region               = "ap-east-1"
  vpc_id               = "vpc-00b1628ca609d5dc2"
  name                 = "private-test"
  env                  = "private-test"
  subnets_cidr  = "172.31.1.0/24"
  availability_zones   = "ap-east-1a"
  subnet_type = "private"
  route = "nat"
  route_table_id = "rtb-0974885252a19fe97"
  gateway_id = "nat-0bb791d0f0fac8079"
}


module "no-route-test" {

source = "./modules/terraform-aws-vpc"

  region               = "ap-east-1"
  vpc_id               = "vpc-00b1628ca609d5dc2"
  name                 = "no-route-test"
  env                  = "no-route-test"
  subnets_cidr  = "172.31.3.0/24"
  availability_zones   = "ap-east-1a"
  subnet_type = "private"
}

