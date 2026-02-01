variable "bucket" {
  type = string
  default = "resource"
}

variable "customerName" {
  type = string
  default = "fedex"
}

variable "Environment" {
  type = string
  default = "staging"
}

variable "Created_by" {
  type = string
  default = "terraform"
}

variable "name" {
  type = string
  default = "aws-resource"
}

locals {
  s3_origin_id = "s3-${aws_s3_bucket.bucket.id}"
}