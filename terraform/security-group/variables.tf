variable "name" {
  description = "Name for the security group"
}

variable "description" {
  description = "Description for the security group"
}

variable "ingress_ports_specific" {
  description = "List of ingress ports open for specific IPs"
  type        = list(number)
}
variable "ingress_ports_open" {
  description = "List of ingress ports open for all IPs"
  type        = list(number)
}
variable "egress_ports" {
  description = "List of egress ports open for all IPs"
  type        = list(number)
}

variable "cidr_blocks" {
  description = "List of CIDR blocks"
  type        = list(string)
}
variable "tag_name" {
  description = "Tag Name of security group"
}
