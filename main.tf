
terraform{
    backend "s3" {
    bucket = "aalimsee-ce9-test-bucket" 
    key    = "Users/aaronlim/ce9-exercises/exercise1/terraform.tfstate" # Replace the value of key to <your suggested name>.tfstate for example terraform-ex-ec2-<NAME>.tfstate
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
