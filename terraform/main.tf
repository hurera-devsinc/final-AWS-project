module "jenkins_security_group" {
  source                 = "./security-group"
  name                   = "Allow web traffic"
  tag_name               = "Jenkins-${var.security_group_name_prefix}"
  description            = "inbound ports for ssh and standard http and everything outbound"
  ingress_ports_specific = [22]
  ingress_ports_open     = [80, 443]
  egress_ports           = [0]
  cidr_blocks            = [var.your_ip, var.jenkins_ip]
}

module "rails_security_group" {
  source                 = "./security-group"
  name                   = "Rails Security Group"
  tag_name               = "rails-${var.security_group_name_prefix}"
  description            = "Rails Security Group"
  ingress_ports_specific = [22]
  ingress_ports_open     = [80, 443]
  egress_ports           = [0]
  cidr_blocks = [var.your_ip, var.jenkins_ip]
}

module "jenkins_ec2" {
  name   = "Jenkins"
  source = "./ec2"
  ami           = var.ami_id
  instance_type = var.instance_type
  depends_on = [module.jenkins_security_group]
  security_group_names = [module.jenkins_security_group.security_group_name]
  provisioner_inline = var.jenkins_provisioner_commands
}

module "rails_ec2" {
  name   = "rails-ec2"
  source = "./ec2"
  ami           = var.ami_id
  instance_type = var.instance_type
  depends_on    = [module.rails_security_group]
  security_group_names = [module.rails_security_group.security_group_name]
  provisioner_inline = var.rails_provisioner_commands
}

