resource "aws_launch_template" "main" {
  name = "sre-onboarding-shinta-terraform-launch-template"

  disable_api_stop        = false
  disable_api_termination = false

  image_id      = aws_ami.main.id
  instance_type = "t2.micro"
  key_name      = "sre-onboarding-shinta"

  vpc_security_group_ids = [aws_security_group.ec2.id]

  iam_instance_profile {
    arn = aws_iam_instance_profile.main.arn
  }

  user_data = base64encode(file("launch_nginx.sh"))
}
