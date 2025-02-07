# Bucket to be use is created by Luqman. The bucket name is "sctp-ce9-tfstate". Use to store our tfstate files for collabration. 

terraform{
    backend "s3" {
    bucket = "sctp-ce9-tfstate"
    key    = "aalimsee-ce9-exercise1-s3.tfstate" 
    # Replace the value of key to <your suggested name>.tfstate, eg. terraform-ex-ec2-<NAME>.tfstate
    region = "us-east-1"
  }
}
