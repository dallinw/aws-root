resource "aws_ecr_repository" "platform" {
  name                 = "platform"
  image_tag_mutability = "IMMUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = merge(
    var.common_tags,
    {
      type = "helm"
    }
  )
}