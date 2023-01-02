# Creating security group for Bastion Host/Jump Box
resource "aws_security_group" "BH-SG" {

  depends_on = [
    aws_vpc.default,
    aws_subnet.public__b,
    aws_subnet.public__a
    ]


  description = "for ping"
  name = "bastion-host-sg"
  vpc_id = aws_vpc.default.id

  # Created an inbound rule for Bastion Host SSH
  ingress {
    description = "Bastion Host SG"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "output from Bastion Host"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}