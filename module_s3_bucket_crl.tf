module "ca_crl_bucket" {
  source                  = "git::ssh://git@github.com/osodevops/aws-terraform-module-s3.git"
  s3_bucket_name          = local.crl_bucket_name
  s3_bucket_acl           = "private"
  s3_bucket_force_destroy = false
  s3_bucket_policy        = ""
  common_tags             = var.common_tags

  # Bucket public access
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true

  # Versioning
  versioning = {
    enabled = true
    mfa_delete = true
  }

  # Encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }
}