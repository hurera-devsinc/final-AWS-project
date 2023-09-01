variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "ap-southeast-1"
}

variable "aws_profile" {
  description = "AWS profile"
  default = ""
}

variable "your_ip" {
  description = "Your public IP address"
  default     = "111.68.97.202/32"
}

variable "jenkins_ip" {
  description = "Jenkins server's public IP address"
  default     = "54.251.140.205/32"
}

variable "security_group_name_prefix" {
  description = "Prefix for security group names"
  default     = "sg"
}

variable "ami_id" {
  description = "AMI ID for instances"
  default     = "ami-09cfb2d85ab4c17ca"
}

variable "instance_type" {
  description = "Instance type for instances"
  default     = "t2.micro"
}

variable "jenkins_provisioner_commands" {
  description = "Provisioner commands for Jenkins instance"
  type        = list(string)
  default = [
    "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
    "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
    "sudo yum upgrade -y",
    "sudo amazon-linux-extras install epel -y",
    "sudo amazon-linux-extras install java-openjdk11 -y",
    "sudo yum install jenkins -y",
    "sudo systemctl daemon-reload",
    "sudo systemctl enable jenkins",
    "sudo systemctl start jenkins",
  ]
}

variable "rails_provisioner_commands" {
  description = "Provisioner commands for Rails instance"
  type        = list(string)
  default = [
    "sudo yum upgrade -y",
    "sudo yum install -y docker",
    "sudo systemctl start docker",
    "sudo systemctl enable docker",
    "sudo systemctl status docker",
    "sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
    "sudo chmod +x /usr/local/bin/docker-compose",
    "docker-compose version",
  ]
}




