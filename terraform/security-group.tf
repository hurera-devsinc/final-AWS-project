variable "your_ip" {
  description = "Your public IP address"
  default     = "111.68.97.202/32"
}
variable "jenkins_ip" {
  description = "Your public IP address"
  default     = "54.251.140.205/32"
}

variable "ingressports" {
  type    = list(number)
  default = [80 ,443]
}

resource "aws_security_group" "jenkins-sg" {
  name        = "Allow web traffic"
  description = "inbound ports for ssh and standard http and everything outbound"
  
  dynamic "ingress" {
    for_each = var.ingressports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP and HTTPS from everywhere
    }
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_ip]  # Allow SSH only from my IP
  }

  # ingress {
  #   from_port   = 8080
  #   to_port     = 8080
  #   protocol    = "tcp"
  #   cidr_blocks = [var.your_ip]  # Allow Jenkins only from my IP
  # }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    "Name"      = "Jenkins-sg"
    "Terraform" = "true"
  }
}

resource "aws_security_group" "rails-sg" {
  name        = "Rails Security Group"
  description = "Rails Security Group"
  
  dynamic "ingress" {
    for_each = var.ingressports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP and HTTPS from everywhere
    }
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_ip]  # Allow SSH only from my IP
  }

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.jenkins_ip] 
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    "Name"      = "rails-sg"
    "Terraform" = "true"
  }
}
