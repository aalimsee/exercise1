
# Create AWS S3
resource "aws_s3_bucket" "bucket" {
  bucket        = "aalimsee-ce9-test-bucket" # Change to a globally unique name
  force_destroy = true

  tags = {
    Name        = "aalimsee-ce9-S3-Bucket" # Change to your own name
    Environment = "Dev"
  }
}
