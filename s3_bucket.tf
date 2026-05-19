resource "aws_s3_bucket" "my-bucket" {
   bucket = "my-first-tf-automation-bucket"

  tags = {
    Name        = "My bucket"
    # Environment = "Dev"
  }
}
