resource "aws_lb" "main" {
  name = "sre-onboarding-shinta-tf-alb"
  ip_address_type = "ipv4"
  security_groups = [aws_security_group.alb.id]
  subnets = module.vpc.public_subnets

  tags = {
    Name = "sre-onboarding-shinta-tf-alb"
  }
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_target_group" "main" {
  name = "sre-onboarding-shinta-tf-alb-tg"
  
  port = 80
  ip_address_type = "ipv4"
  protocol = "HTTP"
  vpc_id = module.vpc.vpc_id

  health_check {
    enabled = true
    healthy_threshold = 5
    interval = 30
    matcher = "200-399"
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 5
    unhealthy_threshold = 2
  }
}

