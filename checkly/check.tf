resource "checkly_check" "api-check-1" {
  name              = "API check 1"
  type              = "API"
  frequency         = 60
  activated         = true
  muted             = true
  double_check      = true
  max_response_time = 18000
  locations = [
    "eu-central-1",
    "us-east-2",
  ]

  request {
    method = "GET"
    url    = "https://api.checklyhq.com/public-stats"

    assertion {
      comparison = "EQUALS"
      property   = ""
      source     = "STATUS_CODE"
      target     = "200"
    }
  }

  use_global_alert_settings = true

}

variable "checkly_api_key" {
  description = "Checkly user-level API key - https://app.checklyhq.com/settings/account/api-keys"
}

# export TF_VAR_checkly_account_id=""
variable "checkly_account_id" {
  description = "Checkly Account ID - https://app.checklyhq.com/settings/account/general"
}
