remote_state {
  backend = "s3"
  config = {
    bucket = "terragrunt-sample-dev-tfstate"
    key    = "${path_relative_to_include()}.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}

# create provider.tf file and define as following `contents`
generate "provider" {
  path      = "_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = file("../provider.tf")
}

# create version.tf file and define as following `contents`
generate "version" {
  path      = "_version.tf"
  if_exists = "overwrite_terragrunt"
  contents  = file("../version.tf")
}
