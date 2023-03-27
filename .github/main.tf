resource "aws_kms_key" "tezkey" {
  description             = "This is the key for our repo"
  deletion_window_in_days = 30
}

resource "aws_s3_bucket" "tezbucket" {
  bucket = "bootcamp-30-7-tez"

  #   server_side_encryption_configuration {
  #     rule {
  #       apply_server_side_encryption_by_default {
  #         kms_master_key_id = aws_kms_key.g7key.arn
  #         sse_algorithm     = "aws:kms"
  #       }
  #     }
  #   }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tez_s3" {
  bucket = aws_s3_bucket.tezbucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tezkey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_vpc" "actions" {
  cidr_block       = "10.0.0.0/16"
    tags = {
    Name = "class30"
    Team = "DevOps"
  }
}

terraform {               #  Configure Terraform to point to this backend        
  backend "s3" {
    bucket         = "bootcamp-30-7-tez"    # the name of your bucket
    key            = "terraform.tfstate"
    region         = "us-east-1"      
  }
}    