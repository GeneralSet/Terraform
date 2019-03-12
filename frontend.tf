resource "aws_s3_bucket" "frontend" {
  bucket = "www.generalset.io"
  acl    = "public-read"
  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[{
        "Sid":"PublicReadForGetBucketObjects",
        "Effect":"Allow",
        "Principal": "*",
        "Action":"s3:GetObject",
        "Resource":["arn:aws:s3:::www.generalset.io/*"
        ]
    }]
}
POLICY

  website {
    index_document = "index.html"
  }
}
