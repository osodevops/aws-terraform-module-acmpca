# aws-terraform-module-acmpca
Create AWS Certificate Manager Private Certificate Authorities (ACM PCA Certificate Authorities)

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "campca" {
  source                  = "osodevops/aws-terraform-module-acmpca"
  algorithm               = var.algorithm
  subject                 = var.subject
  common_tags             = var.common_tags
}
```

## Example configuration
```hcl
algorithm = {
  key     = "RSA_4096"
  signing = "SHA512WITHRSA"
}

subject = {
  common_name         = "eu-west-2.oso.io"
  country             = "UK"
  organization        = "OSO (UK) Ltd"
  organizational_unit = "Certificate Management"
}
```
