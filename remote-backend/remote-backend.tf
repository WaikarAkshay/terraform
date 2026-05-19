#s3
resource "aws_s3_bucket" "remote-storage" {
  bucket = "remote-storage-s3-akshay"

  tags = {
    Name        = "remote-storage-s3-akshay"
  }
}

# dynaoDB

resource "aws_dynamodb_table" "remote-backend" {
  name           = "remote-backend-db"
  billing_mode   = "PAY_PER_REQUEST"
#   read_capacity  = 20
#   write_capacity = 20
  hash_key       = "LockID"
#   range_key      = "GameTitle"

  attribute {
    name = "LockID"
    type = "S"
  }
}