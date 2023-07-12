resource "aws_s3_bucket" "main" {
  bucket = "sre-onboarding-shinta"

  tags = {
    Name = "sre-onboarding-shinta"
  }
}
