variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_STAGING"
}

variable "env_name" {
  type    = string
  default = "STAGING"
}

variable "snowflake_password" {
  type        = string
  description = "User password used to access Snowflake"
  sensitive   = true
}