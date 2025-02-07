# Terraform S3 Bucket w/ backend upload
hcl

# Software Tree
.
├── README.md
├── main.tf
├── provider.tf
├── terraform.tfstate
└── terraform.tfstate.backup

1 directory, 5 files

# Terraform codes

  # provider.tf
  terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
      }
    }
  }

  # Configure the AWS Provider
  provider "aws" { 
    region = "us-east-1"
  }

# main.tf
terraform{
    backend "s3" {
    bucket = "aalimsee-ce9-test-bucket" 
    key    = "Users/aaronlim/ce9-exercises/exercise1/terraform.tfstate" 
    # Replace the value of key to <your suggested name>.tfstate for example terraform-ex-ec2-<NAME>.tfstate
    region = "us-east-1"
  }
}

# Create AWS S3
resource "aws_s3_bucket" "bucket" {
  bucket = "aalimsee-ce9-test-bucket" # Change to a globally unique name

  tags = {
    Name        = "aalimsee Bucket" # Change to your own name
    Environment = "Dev"
  }
}


# Issues - Terraform Backend Duplicated
    # add additional bucket for tfstate files
    backend "my_s3" {
    bucket = "aalimsee-ce9-tfstate"
    key    = "aalimsee-ce9-exercise1-s3.tfstate" 
    # Replace the value of key to <your suggested name>.tfstate, eg. terraform-ex-ec2-<NAME>.tfstate
    region = "us-east-1"
  }
  
aaronlim@Aarons-MacBook-Air exercise1 % terraform init
Initializing the backend...
╷
│ Error: Terraform encountered problems during initialisation, including problems
│ with the configuration, described below.
│ 
│ The Terraform configuration must be valid before initialization so that
│ Terraform can determine which modules and providers need to be installed.

│ Error: Duplicate backend configuration
│ 
│   on backend.tf line 12, in terraform:
│   12:     backend "my_s3" {
│ 
│ A module may have only one backend configuration. The backend was previously configured at backend.tf:4,5-17.
╵
aaronlim@Aarons-MacBook-Air exercise1 % 