# terraform {
#   required_version = ">= 1.5.0"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 6.0"
#     }
#   }

  # backend "s3" {
  #   bucket = "remote-storage-s3-akshay"
  #   key = "terraform.tfstate"
  #   dynamodb_table = "remote-backend-db"
  #   region = "us-east-2"
    
  # }
# }

# provider "aws" {
#   region = "us-east-2"
# }