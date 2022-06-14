resource "aws_kms_key" "terramera_kms_key" {
  description         = "This key is used to encrypt bucket objects in terramera-demo"
  enable_key_rotation = true
  policy              = data.aws_iam_policy_document.terramera_backend_kms_policy.json

  tags = {
    Repo        = "github.com/niceandgoodonline/terramera-demo"
    Environment = "terramera"
  }
}


resource "aws_s3_bucket" "terramera_backend" {
  bucket = "terramera-demo-backend"

  tags = {
    Repo        = "github.com/niceandgoodonline/terramera-demo"
    Environment = "terramera"
  }
}

resource "aws_s3_bucket_acl" "terramera_backend_acl" {
  bucket = aws_s3_bucket.terramera_backend.id
  acl    = "private"
}


resource "aws_s3_bucket_server_side_encryption_configuration" "terramera_backend_kms_config" {
  bucket = aws_s3_bucket.terramera_backend.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.terramera_kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
