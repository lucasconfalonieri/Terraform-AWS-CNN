resource "aws_s3_bucket_policy" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicRead"
        Effect    = "Allow"
        Principal = "*"
        Action    = [
          "s3:GetObject",
          "s3:GetObjectVersion"
        ]
        Resource  = "arn:aws:s3:::dataset-frutas-verduras-17062024/*"
      }
    ]
  })
}