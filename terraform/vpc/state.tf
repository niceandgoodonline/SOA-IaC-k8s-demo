resource "aws_ssm_parameter" "vpc_id_state" {
  depends_on = [
    module.vpc
  ]
  name  = "/terramera-demo/state/vpc/id"
  type  = "String"
  value = module.vpc.id
}

resource "aws_ssm_parameter" "vpc_private_subnets_state" {
  depends_on = [
    module.vpc
  ]
  name  = "/terramera-demo/state/vpc/private_subnets"
  type  = "StringList"
  value = join(",", module.vpc.private_subnets)
}

resource "aws_ssm_parameter" "vpc_public_subnets_state" {
  depends_on = [
    module.vpc
  ]
  name  = "/terramera-demo/state/vpc/public_subnets"
  type  = "StringList"
  value = join(",", module.vpc.public_subnets)
}
