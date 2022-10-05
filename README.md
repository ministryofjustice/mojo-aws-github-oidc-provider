[![repo standards badge](https://img.shields.io/badge/dynamic/json?color=blue&style=flat&logo=github&labelColor=32393F&label=MoJ%20Compliant&query=%24.result&url=https%3A%2F%2Foperations-engineering-reports.cloud-platform.service.justice.gov.uk%2Fapi%2Fv1%2Fcompliant_public_repositories%2Fmojo-aws-github-oidc-provider)](https://operations-engineering-reports.cloud-platform.service.justice.gov.uk/public-github-repositories.html#mojo-aws-github-oidc-provider "Link to report")

# AWS GitHub OIDC Provider

An AWS Github OIDC provider is managed on MoJO Shared Services AWS account. This OIDC provider can be used in GitHub workflow action in any repositories in **ministryofjustice** GitHub organisation.

Make sure the repository is added in the `locals.tf` file in the `github_repositories` list.

Terraform will provide an output of the `role-arn`. This `role-arn` can be used as value for the `role-to-assume` attribute within a GitHub workflow in order to authenticate that workflow job against an AWS account.

This `role-arn` can also be stored as GitHub secret in any repository. Please refer to the `github.tf` file. You need to [create a GitHub personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) and store in the `.env` file in order to get this done.

## How to use this

1. Clone this repository in a directory on your developers workstation.
1. Change your working directory to the newly created directory `aws-github-oidc-provider`.
1. Copy `.env.example` file and create `.env` file.
1. Create a GitHub personal access token. Please use this [guide](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) if you need help.
1. Add the token in the `.env` file.
1. Make sure the `AWS_PROFILE` values matches the AWS Cli profile name for the MoJO Shared Services AWS account on your workstation. It is recommended that you use [MoJ Cloud Operations Team - Best practices guide](https://ministryofjustice.github.io/cloud-operations/documentation/team-guide/best-practices/use-aws-sso.html#configure-aws-vault) to configure your AWS-Vault with AWS SSO.
1. Make sure correct repositories are added in the `github_repositories` in the `locals.tf` file.
1. Run `make apply` to apply terraform. See `Makefile` for more targets.
