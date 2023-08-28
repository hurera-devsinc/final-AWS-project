# data "aws_ami" "amazon-linux-2" {
#   most_recent = true

#   filter {
#     name   = "owner-alias"
#     values = ["amazon"]
#   }


#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm*"]
#   }

#   owners = ["amazon"]

# }


resource "aws_instance" "jenkins" {
  # ami             = data.aws_ami.amazon-linux-2.id
  ami             = "ami-09cfb2d85ab4c17ca"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.jenkins-sg.name]
  key_name        = "jenkins"
  provisioner "remote-exec" {
     inline = [

      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",

      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      
      "sudo yum upgrade -y",
      
      "sudo amazon-linux-extras install epel -y",

      "sudo amazon-linux-extras install java-openjdk11 -y",
      
      "sudo yum install jenkins -y",

      "sudo systemctl daemon-reload",
      
      "sudo systemctl enable jenkins",
      
      "sudo systemctl start jenkins"
    ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("/home/hurera/Downloads/jenkins.pem")
  }
  tags = {
    "Name" = "Jenkins"
  }
}


resource "aws_instance" "rails-ec2" {
  ami             = "ami-09cfb2d85ab4c17ca"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.rails-sg.name]
  key_name        = "rails-ec2"
  provisioner "remote-exec" {
     inline = [
      "sudo yum upgrade -y",
      "sudo yum install -y docker",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo systemctl status docker",
      "sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "docker-compose version"
    ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = "${file("${path.module}/rails-ec2.pem")}"
  }
  tags = {
    "Name" = "rails-ec2"
  }
}

