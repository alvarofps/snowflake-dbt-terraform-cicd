terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.66.1"
    }
  }

  backend "s3" {
    bucket = "sk-terraform-state-bucket-prod"
    key    = "terraform-prod.tfstate"
    region = "eu-west-2"
    # Optional DynamoDB for state locking. See https://developer.hashicorp.com/terraform/language/settings/backends/s3 for details.
    # dynamodb_table = "terraform-state-lock-table"
    encrypt  = true
    role_arn = "arn:aws:iam::339712836592:role/terraform-backend-acess-role"
  }
}

provider "snowflake" {
  username = "alvarofps"
  account  = "bz91243.eu-west-2.aws"
  role     = "ACCOUNTADMIN"
  #private_key = var.snowflake_private_key
  password = "Seguridad199725@"
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 30
  database            = var.database
  env_name            = var.env_name
}