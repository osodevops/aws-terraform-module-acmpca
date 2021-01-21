resource "aws_s3_bucket_policy" "crl_bucket" {
  bucket = module.ca_crl_bucket.id
  policy = data.aws_iam_policy_document.crl_bucket_access.json
}

data "aws_iam_policy_document" "crl_bucket_access" {
  statement {
    principals {
      identifiers = ["acm-pca.amazonaws.com"]
      type        = "Service"
    }

    actions = [
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
      "s3:PutObject",
      "s3:PutObjectAcl",
    ]

    resources = [
      module.ca_crl_bucket.arn,
      "${module.ca_crl_bucket.arn}/*",
    ]
  }
}