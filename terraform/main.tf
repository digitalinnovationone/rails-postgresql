provider "aws" {
  region = "sa-east-1"
}

resource "aws_security_group" "rails" {
  name        = "rails_app_sg"
  description = "Rails App Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "maquina_terraform" {
  ami                    = "ami-0080974613cf1e8c7"
  instance_type          = "t2.small"
  key_name               = "rails-app"
  security_groups        = [aws_security_group.rails.name]

  tags = {
    Name = "RailsTerraform"
  }
}
