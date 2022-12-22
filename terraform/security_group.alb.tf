resource "aws_security_group" "alb" {
  description = "security-group--alb"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

    ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 5000
    protocol    = "tcp"
    to_port     = 5000
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    protocol  = "tcp"
    to_port   = 65535
  }


  name = "security-group--alb"

  tags = {
    Env  = "production"
    Name = "security-group--alb"
  }

  vpc_id = aws_vpc.default.id
}