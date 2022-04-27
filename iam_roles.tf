# IAM role for GitHub workflows

data "aws_iam_policy_document" "github_workflow_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.this.url, "https://", "")}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "${replace(aws_iam_openid_connect_provider.this.url, "https://", "")}:sub"
      values   = ["repo:ministryofjustice/staff-external-dynamic-list:*"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.this.arn]
      type        = "Federated"
    }
  }
}

module "iam_role_label" {
  source = "./modules/label"
  name   = "github-oidc-iam-role"
}

resource "aws_iam_role" "github_workflow" {
  assume_role_policy = data.aws_iam_policy_document.github_workflow_assume_role_policy.json
  name               = "GitHubWorkflow"

  tags = module.iam_role_label.tags
}

resource "aws_iam_role_policy_attachment" "github_workflow_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.github_workflow.name
}
