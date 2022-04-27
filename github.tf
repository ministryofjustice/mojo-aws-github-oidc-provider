resource "github_actions_secret" "aws_role_to_secret" {
  repository      = "staff-device-private-dns-zone"
  secret_name     = "AWS_ROLE_TO_ASSUME"
  plaintext_value = aws_iam_role.github_workflow.arn
}
