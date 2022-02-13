# terraform-aws-vpc
terraform-aws-vpc level3

Define variables in main.tf

Pre-requirement:

1. VPC
2. Internet Gateway and Route Table if the create subnet need to route to Internet Gateway
3. NAT Gateway and Route Table if the create subnet need to route to NAT Gateway 


Definition of Variables:
region               		: Region
vpc_id               		: ID of VPC
name                 		: Namne Tag
env                  		: Environment Tag
subnets_cidr  				: Segment of the subnet ( the range must be in VPC cidr block)
availability_zones   		: Availability Zone
subnet_type 				: Subnet type "public" or "private"
route 						: Value should be "nat" or "internal" if route should be created. If the value is "", no route will be created
route_table_id 				: Route Table ID of NAT/Internet. If no route should be created, keep the value empty
gateway_id 					: Gateway ID of NAT/Internet Gateway. If no route should be created, keep the value empty

