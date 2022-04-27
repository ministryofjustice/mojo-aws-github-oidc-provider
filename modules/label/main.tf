module "label" {
  source    = "cloudposse/label/null"
  version   = "0.25.0"
  delimiter = "-"
  name      = var.name
  namespace = "mojo"
  stage     = "release"

  tags = {
    "business-unit"    = "HQ"
    "environment-name" = "Global"
    "owner"            = "Cloud Operations"
    "is-production"    = true
    "application"      = "mojo-aws-github-oidc-provider"
    "source-code"      = "https://github.com/ministryofjustice/mojo-aws-github-oidc-provider"
  }
}
