remote_state {
  backend = "s3"
  config = {
    bucket = "terragrunt-sample-tfstate"
    key    = "${path_relative_to_include()}.tfstate"
    region = "ap-northeast-1"
  }
}

# create provider.tf file and define as following `contents`
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "ap-northeast-1"
}
EOF
}

# create version.tf file and define as following `contents`
generate "version" {
  path      = "version.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = "= 1.0.6"
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.61.0"
    }
  }
}
EOF
}
