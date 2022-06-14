resource "aws_ssm_parameter" "vpc_id_state" {
  name  = "/terramera-demo/state/vpc/id"
  type  = "String"
  value = module.terramera_vpc.id
}

resource "aws_ssm_parameter" "vpc_private_subnets_state" {
  name  = "/terramera-demo/state/vpc/private_subnets"
  type  = "String"
  value = module.terramera_vpc.private_subnets
}

resource "aws_ssm_parameter" "vpc_public_subnets_state" {
  name  = "/terramera-demo/state/vpc/public_subnets"
  type  = "String"
  value = module.terramera_vpc.public_subnets
}
