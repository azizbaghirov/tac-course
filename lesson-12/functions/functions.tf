terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.01"
    }
  }

  required_version = ">= 1.4.6"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "testuser" {
  name = "testuser"
  tags = {
    department = "OPS"
    time-created = timestamp()
    time2 = formatdate("MM DD YYYY hh:mm ZZZ", timestamp())
  }
}