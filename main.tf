terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.65.0"
    }
  }
  backend "s3" {
    bucket = "bck-projto-cloud-denize"
    region = "us-east-1"  
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_dynamodb_table" "questions" {
  name           = "questions"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
