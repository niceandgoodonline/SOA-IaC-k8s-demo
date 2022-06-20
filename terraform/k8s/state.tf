resource "aws_ssm_parameter" "k8s_ec2_instance_id" {
  depends_on = [
    module.kubernetes_ec2
  ]
  name  = "/soc-iac-k8s-demo/state/k8s/instance_id"
  type  = "String"
  value = module.kubernetes_ec2.id
}

resource "aws_ssm_parameter" "k8s_ec2_arn" {
  depends_on = [
    module.kubernetes_ec2
  ]
  name  = "/soc-iac-k8s-demo/state/k8s/instance_arn"
  type  = "String"
  value = module.kubernetes_ec2.arn
}

resource "aws_ssm_parameter" "k8s_ec2_private_ip" {
  depends_on = [
    module.kubernetes_ec2
  ]
  name  = "/soc-iac-k8s-demo/state/k8s/private_ip"
  type  = "String"
  value = module.kubernetes_ec2.private_ip
}

resource "aws_ssm_parameter" "k8s_ec2_public_dns" {
  depends_on = [
    module.kubernetes_ec2
  ]
  name  = "/soc-iac-k8s-demo/state/k8s/public_dns"
  type  = "String"
  value = module.kubernetes_ec2.public_dns
}
