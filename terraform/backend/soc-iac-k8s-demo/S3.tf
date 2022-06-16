resource "aws_kms_key" "soc_iac_k8s_kms_key" {
  description         = "This key is used to encrypt bucket objects in soc-iac-k8s-demo-backend"
  enable_key_rotation = true
  policy              = data.aws_iam_policy_document.soc_iac_k8s_backend_kms_policy.json

  tags = {
    Repo        = "github.com/niceandgoodonline/soc-iac-k8s-demo"
    Environment = "soc-iac-k8s"
  }
}


resource "aws_s3_bucket" "soc_iac_k8s_backend" {
  bucket = "soc-iac-k8s-demo-backend"

  tags = {
    Repo        = "github.com/niceandgoodonline/soc-iac-k8s-demo"
    Environment = "soc-iac-k8s"
  }
}

resource "aws_s3_bucket_acl" "soc_iac_k8s_backend_acl" {
  bucket = aws_s3_bucket.soc_iac_k8s_backend.id
  acl    = "private"
}


resource "aws_s3_bucket_server_side_encryption_configuration" "soc_iac_k8s_backend_kms_config" {
  bucket = aws_s3_bucket.soc_iac_k8s_backend.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.soc_iac_k8s_kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
