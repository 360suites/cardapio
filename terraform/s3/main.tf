provider "aws" {
  region = var.region
  profile = var.profile
}
resource "aws_s3_bucket" "this" {
  bucket = var.bucket
  acl    = "private" ## private ou public
  #tags = var.tags
}
