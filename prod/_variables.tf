variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_PROD"
}

variable "env_name" {
  type    = string
  default = "PROD"
}

# variable "snowflake_user_password" {
#   type        = string
#   description = "Password for the user to access Snowflake"
#   sensitive   = true
# }
