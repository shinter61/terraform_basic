resource "aws_ecr_repository" "main" {
  name                 = "sre-onboarding-shinta-b4"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}
