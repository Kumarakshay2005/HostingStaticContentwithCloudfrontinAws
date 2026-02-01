# To upload website files in s3 bucket

resource "aws_s3_object" "object" {
 for_each= fileset("${path.module}/static" , "**/*")

  bucket = aws_s3_bucket.bucket.id
  key    = each.value
  source = "${path.module}/static/${each.value}"
  etag = filemd5("${path.module}/static/${each.value}")
  content_type = lookup({
    "html" = "text/html",
    "css"  = "text/css",
    "js"   = "application/javascript",
  }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
}