module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "k8s"

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnets[random_integer.subnet_int.result]

  tags = var.tags
}

resource "random_integer" "subnet_int" {
  min = 0
  max = 1
}
