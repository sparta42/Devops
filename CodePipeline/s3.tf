resource "aws_s3_bucket" "Sparta42BE" {
  bucket        = "sparta42be"
  acl           = "public-read-write"
  force_destroy = "true"
  policy        = file("./policy/s3_public.json")
  # versioning {
  #   enabled = true
  # }
}