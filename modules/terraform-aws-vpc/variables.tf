variable "region" {
  type    = string
  default = "ap-east-1"
}


variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "subnets_cidr" {
  type = string
}

variable "availability_zones" {
  type = string
}

variable "route" {
  type = string
  default = ""
}

variable "subnet_type" {
  type = string
} 


variable "gateway_id" {
  type = string
  default = ""
}


variable "vpc_id" {
  type = string
}

variable "route_table_id" {
  type = string
  default = ""
}
