terraform {
  backend "s3" {
    bucket = "terramera-demo-backend"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
