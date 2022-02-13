module "public-test" {

source = "./modules/terraform-aws-vpc"

  region               = "ap-east-1"
  vpc_cidr             = "10.10.0.0/16"
  name                 = "public-test"
  env                  = "public-test"
  subnets_cidr  = "10.10.0.0/24"
  availability_zones   = "ap-east-1a"
  subnet_type = "public"
  route = ""
}


module "private-test" {

source = "./modules/terraform-aws-vpc"

  region               = "ap-east-1"
  vpc_cidr             = "10.11.0.0/16"
  name                 = "private-test"
  env                  = "private-test"
  subnets_cidr  = "10.11.1.0/24"
  availability_zones   = "ap-east-1a"
  subnet_type = "private"
  route = "internet"
}


