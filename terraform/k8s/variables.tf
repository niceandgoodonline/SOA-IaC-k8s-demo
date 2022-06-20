variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "ami_id" {
  type = string
  default = "ami-ebd02392"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "tags" {
  type = object({
    Repo        = string
    Environment = string
  })
  default = {
    Repo        = "github.com/niceandgoodonline/soc-iac-k8s-demo"
    Environment = "soc-iac-k8s"
  }
}
