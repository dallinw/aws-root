data "aws_ssoadmin_instances" "administrators" {}

resource "aws_ssoadmin_permission_set" "administrators" {
  name             = "administrators"
  description      = "General admin permission set"
  instance_arn     = tolist(data.aws_ssoadmin_instances.administrators.arns)[0]
  relay_state      = "https://s3.console.aws.amazon.com/s3/home?region=${var.region}#"
  session_duration = "PT12H"

  tags = merge(
    var.common_tags
  )
}

resource "aws_ssoadmin_managed_policy_attachment" "example" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.administrators.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.administrators.arn
}
