module "ecr" {
  source = "./ecr"
  common_tags = local.common_tags
}

#module "kms" {
#  source = "./kms"
#  common_tags = local.common_tags
#}