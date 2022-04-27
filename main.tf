terraform {
  backend "s3" {
    bucket         = "mojo-aws-github-oidc-provider-core-tf-state"
    dynamodb_table = "mojo-aws-github-oidc-provider-core-tf-lock-table"
    region         = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
}

provider "github" {
  # Configuration options
}

module "oidc_provider_label" {
  source = "./modules/label"
  name   = "github-oidc-provider"
}

data "tls_certificate" "this" {
  url = "https://token.actions.githubusercontent.com"
}

resource "aws_iam_openid_connect_provider" "this" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.this.certificates[0].sha1_fingerprint]
  url             = "https://token.actions.githubusercontent.com"

  tags = module.oidc_provider_label.tags
}
