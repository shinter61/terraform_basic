resource "aws_security_group" "ec2" {
  name = "sre-onboarding-shinta-terraform-ec2-sg"

  vpc_id = module.vpc.vpc_id

  ingress {
    description = "Allow http access from vpc"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb" {
  name = "sre-onboarding-shinta-terraform-alb-sg"

  vpc_id = module.vpc.vpc_id

  ingress {
    description = "Allow http access from office vpn"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.office_vpn]
  }

  ingress {
    description = "Allow https access from office vpn"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.office_vpn]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
