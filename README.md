# Terraform Module - Lambda Edge

Creates lambda edge role, with cloudwatch permission to write logs to, and a bunch of lambda functions loading source from s3, used for cloudfront.

## Usage

Example:

```
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

module "lambda" {
  source        = "git::https://github.com/IronCore864/tfm-lambda-edge.git"
  naming_prefix = "xxx"
  s3_bucket     = "xxx"

  providers = {
    aws = aws.us-east-1
  }
}
```

Lambda Edge must be in us-east-1 region.
