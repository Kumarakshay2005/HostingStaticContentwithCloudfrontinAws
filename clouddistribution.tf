# create a origin access control to access the aws resource

resource "aws_cloudfront_origin_access_control" "aoac" {
  name                              = "${var.name}-${var.customerName}-${var.Environment}"
  description                       = "aws_cloudfront_origin_access_control Policy"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# creating an cloud distribution resoource and providing the route53 domain configuration to acces sthe application

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.aoac.id
    origin_id                = local.s3_origin_id
  }
#    aliases = ["distributions3site.${local.my_domain}"]

  enabled             = true
  comment             = "This is the distribution connection s3 bucket with cloufront using aoc"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }    

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }


  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
      Name = var.customerName
      Environment = var.Environment
      Created_by = var.Created_by    
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    # acm_certificate_arn = data.aws_acm_certificate.my_domain.arn
    # ssl_support_method  = "sni-only"
    # minimum_protocol_version = "TLSv1.2_2021"
  }
}

# Create Route53 records for the CloudFront distribution aliases
# data "aws_route53_zone" "my_domain" {
#   name = local.my_domain
# }

# resource "aws_route53_record" "cloudfront" {
#   for_each = aws_cloudfront_distribution.s3_distribution.aliases
#   zone_id  = data.aws_route53_zone.my_domain.zone_id
#   name     = each.value
#   type     = "A"

#   alias {
#     name                   = aws_cloudfront_distribution.s3_distribution.domain_name
#     zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
#     evaluate_target_health = false
#   }
