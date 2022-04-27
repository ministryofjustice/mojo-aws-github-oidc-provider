resource "github_actions_secret" "aws_role_to_secret" {
  count           = length(local.github_repositories)
  repository      = local.github_repositories[count.index]
  secret_name     = "AWS_ROLE_TO_ASSUME"
  plaintext_value = aws_iam_role.github_workflow.arn
}
