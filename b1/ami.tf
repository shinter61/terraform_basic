resource "aws_ami" "main" {
  name                = "sre-onboarding-shinta-terraform-ami"
  ena_support         = true
  root_device_name    = "/dev/xvda"
  virtualization_type = "hvm"

  ebs_block_device {
    delete_on_termination = true
    device_name           = "/dev/xvda"
    encrypted             = false
    iops                  = 0
    throughput            = 0
    snapshot_id           = "snap-0452e97cb7111ffec"
    volume_size           = 8
    volume_type           = "gp2"
  }
}
