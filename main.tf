module "ecr" {
  source      = "./ecr"
  common_tags = local.common_tags
}

module "sso" {
  source      = "./sso"
  common_tags = local.common_tags
}
