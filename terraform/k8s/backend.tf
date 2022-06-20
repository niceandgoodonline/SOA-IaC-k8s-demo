terraform {
  backend "s3" {
    bucket = "soc-iac-k8s-demo-backend"
    key    = "k8s/terraform.tfstate"
    region = "us-west-2"
  }
}
