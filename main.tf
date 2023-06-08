output "bucketname" {
  value = data.aws_s3_bucket.mybucket6694.bucket
}

resource "aws_s3_bucket_policy" "b" {
  bucket = data.aws_s3_bucket.mybucket6694.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "${data.aws_s3_bucket.mybucket6694.arn}/*",
      "Condition": {
         "IpAddress": {"aws:SourceIp": "8.8.8.8/32"}
      }
    }
  ]
}
POLICY
}
