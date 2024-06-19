resource "aws_iam_group" "admin_group" {
  name = "admin_group"
}

resource "aws_iam_group_policy_attachment" "admin_policy_attachment" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "admin_user" {
  name = "admin_user"
}

resource "aws_iam_user_group_membership" "admin_user_membership" {
  user = aws_iam_user.admin_user.name
  groups = [
    aws_iam_group.admin_group.name,
  ]
}

resource "aws_iam_access_key" "admin_user_access_key" {
  user = aws_iam_user.admin_user.name
}

output "aws_access_key_id" {
  value = aws_iam_access_key.admin_user_access_key.id
}

output "aws_secret_access_key" {
  value = aws_iam_access_key.admin_user_access_key.secret
}
