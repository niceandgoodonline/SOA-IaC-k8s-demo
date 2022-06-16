terraform {
  backend "s3" {
    bucket = "soc-iac-k8s-demo-backend"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
