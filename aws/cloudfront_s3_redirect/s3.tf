# this is where the latest bucket tagged code will be 
resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.domain}"
  acl           = "public-read"
  force_destroy = false
  versioning {
    enabled    = false
    mfa_delete = false
  }

  website {
    redirect_all_requests_to = var.redirect_to
  }
}

resource "aws_s3_bucket_policy" "bucket" {
  bucket = "${aws_s3_bucket.bucket.id}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AddPerm",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.domain}/*"
        }
    ]
}
POLICY
}
