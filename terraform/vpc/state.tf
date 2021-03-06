resource "aws_ssm_parameter" "vpc_id_state" {
  depends_on = [
    module.vpc
  ]
  name  = "/soc-iac-k8s-demo/state/vpc/id"
  type  = "String"
  value = module.vpc.vpc_id
}

resource "aws_ssm_parameter" "vpc_private_subnets_state" {
  depends_on = [
    module.vpc
  ]
  name  = "/soc-iac-k8s-demo/state/vpc/private_subnets"
  type  = "StringList"
  value = join(",", module.vpc.private_subnets)
}

resource "aws_ssm_parameter" "vpc_public_subnets_state" {
  depends_on = [
    module.vpc
  ]
  name  = "/soc-iac-k8s-demo/state/vpc/public_subnets"
  type  = "StringList"
  value = join(",", module.vpc.public_subnets)
}
