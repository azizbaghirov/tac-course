variable "ami_id" {
  description = "AMI ID for Red Hat 9"
  type        = string
  default     = "ami-078cbc4c2d057c244" # Replace with the actual AMI ID for Red Hat 9 in us-east-2
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"
}

variable "sandy_user" {
  description = "Username to create"
  type        = string
  default     = "sandy"
}
