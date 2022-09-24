terraform {
  backend "remote" {
    organization = "dallinw"

    workspaces {
      name = "aws-root"
    }
  }
}
