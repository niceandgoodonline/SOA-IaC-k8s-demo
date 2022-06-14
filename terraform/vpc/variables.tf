###
# variables for provider.tf
###

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "provider_profile" {
  type    = string
  default = "orchestration"
}

###
# variables for main.tf
###

variable "vpc_name" {
  type    = string
  default = "terramera_vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "vpc_azs" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b"]
}

variable "vpc_public_subnets" {
  type    = list(string)
  default = ["10.20.11.0/24", "10.20.12.0/24"]
}

variable "vpc_private_subnets" {
  type    = list(string)
  default =  ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "igw_name" {
  type    = string
  default = "terramera_vpc_igw"
}

variable "terraform_repo" {
  type    = string
  default = "github.com/niceandgoodonline/terramera-demo"
}

variable "environment" {
  type    = string
  default = "terramera"
}
