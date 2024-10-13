resource "aws_instance" "worker" {
  #  ami           = "ami-0aa8fc2422063977a"
  ami           = "ami-0446717416821c8c2"
  instance_type = "t2.medium"

  subnet_id  = "subnet-05b90b960102537c8"
  private_ip = "172.31.0.11"

  key_name = "aws_key"

  vpc_security_group_ids = [
    aws_security_group.sg_ssh.id,
  ]

  user_data = file("userdata/worker.sh")

  tags = {
    Name = "worker-node"
  }
}

#resource "aws_instance" "master" {
#  ami           = "ami-0aa8fc2422063977a"
#  instance_type = "t2.micro"
#
#  subnet_id  = "subnet-05b90b960102537c8"
#  private_ip = "172.31.0.10"
#
#  key_name = "aws_key"
#
#  vpc_security_group_ids = [
#    aws_security_group.sg_ssh.id,
#  ]
#
#  depends_on = [
#    aws_instance.worker
#  ]
#
#  user_data = file("userdata/master.sh")
#
#  tags = {
#    Name = "master-node"
#  }
#}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/8R1TIb/J+1/vdnZododnTspqcOzhef2RoGWQB8xTf aziz@terraform-pc"
}

resource "aws_security_group" "sg_ssh" {

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 5903
    to_port     = 5903
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 6080
    to_port     = 6080
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}
