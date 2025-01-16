
terraform{
    backend "s3" {
    bucket = "aalimsee-ce9-test-bucket" 
    key    = "Users/aaronlim/ce9-exercises/exercise1/aalimsee-ce9-terraform.tfstate" 
    # Replace the value of key to <your suggested name>.tfstate, eg. terraform-ex-ec2-<NAME>.tfstate
    region = "us-east-1"
  }
}

# Create AWS S3
resource "aws_s3_bucket" "bucket" {
  bucket = "aalimsee-ce9-test-bucket" # Change to a globally unique name
  force_destroy = true

  tags = {
    Name        = "aalimsee-ce9 S3 Bucket" # Change to your own name
    Environment = "Dev"
  }
}
