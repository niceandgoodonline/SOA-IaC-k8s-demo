###
# variables for provider.tf
###

variable "region" {
  type    = string
  default = "us-west-2"
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

variable "bucket" {
  type = string
  default = "soc-iac-k8s-demo-backend"
}
