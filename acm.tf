# data "aws_acm_certificate" "my_domain" {
#   domain   = local.my_domain          # Replace with your domain
#   statuses = ["ISSUED"]
#   most_recent = true       
# }