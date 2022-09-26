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

data "aws_identitystore_group" "administrators" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.administrators.identity_store_ids)[0]

  filter {
    attribute_path  = "DisplayName"
    attribute_value = "Administrators"
  }
}

resource "aws_ssoadmin_account_assignment" "example" {
  instance_arn       = data.aws_ssoadmin_permission_set.administrators.instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.administrators.arn

  principal_id   = data.aws_identitystore_group.administrators.group_id
  principal_type = "GROUP"

  target_id   = var.common_tags.account_id
  target_type = "AWS_ACCOUNT"
}
