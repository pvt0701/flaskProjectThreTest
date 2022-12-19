resource "aws_alb_target_group" "default" {
  health_check {
    path = "/"
  }

  name     = "alb-target-group"
  port     = 80
  protocol = "HTTP"

  stickiness {
    type = "lb_cookie"
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [name]
  }

  vpc_id = aws_vpc.default.id
}