variable "algorithm" {
  description = "Type of the public key and signing algorithm. Valid values can be found in the ACM PCA Documentation."
  type = map(string)
}

variable "certificate_expiry_days" {
  description = "Number of days until a certificate expires. Must be between 1 and 5000."
  type = number
}

variable "common_tags" {
  type = map(string)
}

variable "environment" {
  description = "Environment - used for naming"
  type = string
}

variable "subject" {
  description = ""
  type = map(string)
}

variable "sse_algorithm" {
  default     = "aws:kms"
  type        = string
}

locals {
  crl_bucket_name = "ca-revocation-list-${data.aws_region.current.name}-${lower(data.aws_caller_identity.current.account_id)}"
}