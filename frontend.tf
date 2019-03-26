resource "aws_s3_bucket" "frontend_root" {
  bucket = "generalset.io.bucket"
  acl    = "public-read"
  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[{
        "Sid":"PublicReadForGetBucketObjects",
        "Effect":"Allow",
        "Principal": "*",
        "Action":"s3:GetObject",
        "Resource":["arn:aws:s3:::generalset.io.bucket/*"
        ]
    }]
}
POLICY

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket" "frontend_www" {
  bucket = "www.generalset.io.bucket"

  website {
    redirect_all_requests_to = "generalset.io"
  }
}

locals {
  s3_origin_id = "generalsetS3"
}

resource "aws_cloudfront_distribution" "frontend_cdn" {
  origin {
    domain_name = "${aws_s3_bucket.frontend_root.bucket_regional_domain_name}"
    origin_id   = "${local.s3_origin_id}"
  }

  enabled             = true
  default_root_object = "index.html"

  aliases = ["generalset.io", "www.generalset.io"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${local.s3_origin_id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = "${aws_acm_certificate.my-cert.arn}"
    ssl_support_method = "sni-only"
  }
}

resource "aws_acm_certificate" "my-cert" {
  certificate_body = "${acme_certificate.certificate.certificate_pem}"
  certificate_chain = "${acme_certificate.certificate.issuer_pem}"
  private_key = "${acme_certificate.certificate.private_key_pem}"
}