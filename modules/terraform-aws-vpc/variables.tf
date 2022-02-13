variable "region" {
  type    = string
  default = "ap-east-1"
}

variable "vpc_cidr" {
  type = string
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
}

variable "subnet_type" {
  type = string
} 


variable "internet_gateway_id"{
  type = string
  default = ""
}
