terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
  }

  backend "s3" {
    bucket         = "dev-sk-terraform-state-bucket"
    key            = "terraform-staging.tfstate"
    region         = "eu-west-2"
    # Optional DynamoDB for state locking. See https://developer.hashicorp.com/terraform/language/settings/backends/s3 for details.
    # dynamodb_table = "terraform-state-lock-table"
    encrypt        = true
    role_arn       = "arn:aws:iam::339712836592:role/terraform-backend-acess-role"
  }
}

provider "snowflake" {
  username    = "alvarofps"
  account     = "https://bz91243.eu-west-2.aws.snowflakecomputing.com"
  role        = "ACCOUNTADMIN"
  private_key = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 1
  database            = var.database
  env_name            = var.env_name
}