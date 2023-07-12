resource "aws_autoscaling_group" "main" {
  name = "sre-onboarding-shinta-terraform-asg"

  capacity_rebalance = false

  force_delete = true
  force_delete_warm_pool = true

  health_check_type = "EC2"

  desired_capacity = 3
  max_size = 3
  min_size = 3

  vpc_zone_identifier = module.vpc.private_subnets

  target_group_arns = [aws_lb_target_group.main.arn]

  launch_template {
    id = aws_launch_template.main.id
    version = "$Default"
  }
}

