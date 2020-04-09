resource "aws_iam_role" "this" {
  name               = substr(var.name, 0, 64)
  assume_role_policy = var.assume_role_policy
  tags               = var.tags
}

resource "aws_iam_policy" "this" {
  name   = var.name
  policy = var.policy
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
