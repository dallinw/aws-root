# To be used if KMS is absolutely required, KMS is not free though so avoiding and using default encryption if possible.
resource "aws_kms_key" "default" {
  description             = "KMS default encryption key"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = merge(
    var.common_tags
  )
}