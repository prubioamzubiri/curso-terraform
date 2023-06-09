terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

provider "aws"{
    region = var.AWS_REGION
    access_key = var.AWS_KEY
    secret_key = var.AWS_SECRET_KEY
    token = var.AWS_SESSION_TOKEN
}