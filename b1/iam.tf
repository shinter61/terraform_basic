resource "aws_iam_instance_profile" "main" {
  name = "sre-onboarding-shinta-terraform-ec2-profile"
  role = aws_iam_role.main.name
}

resource "aws_iam_role" "main" {
  name = "sre-onboarding-shinta-terraform-ec2-role"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}
