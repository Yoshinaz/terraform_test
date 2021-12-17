terraform {
  required_version = "~> 1.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "YoshinazOrg"

    workspaces {
      name = "test"
    }
  }
}

# export TF_VAR_checkly_api_key=""
variable "checkly_api_key" {
  description = "Checkly user-level API key - https://app.checklyhq.com/settings/account/api-keys"
}

# export TF_VAR_checkly_account_id=""
variable "checkly_account_id" {
  description = "Checkly Account ID - https://app.checklyhq.com/settings/account/general"
}


module "check" {
  source = "./checkly"
  checkly_api_key = var.checkly_api_key
  checkly_account_id = var.checkly_account_id
}
