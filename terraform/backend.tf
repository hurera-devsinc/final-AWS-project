variable "bucket_name" {
  default = "rails-application-remote-backend-bucket-1"
}
variable "dynamodb_table" {
  default = "terraform-lock"
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.bucket_name
  # acl = "public-read-write"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_acl" "terraform_state_bucket_acl" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  acl = "private"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = var.dynamodb_table
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "rails-application-remote-backend-bucket-1"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

resource "null_resource" "test_resource" {
  triggers = {
    always_run = timestamp()
  }
}
