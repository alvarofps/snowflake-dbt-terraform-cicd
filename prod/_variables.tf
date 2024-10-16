variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_PROD"
}

variable "env_name" {
  type    = string
  default = "PROD"
}

variable "snowflake_password" {
  type        = string
  description = "User password used to access Snowflake"
  sensitive   = true
}
