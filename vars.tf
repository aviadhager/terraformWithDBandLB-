variable "AWS_ACCESS_KEY" {
  default = "AKIATO5DS6VYJ47YMGGT"
}

variable "AWS_SECRET_KEY" {
  default = "tClkgUFQBVu1PKUB8XgVwcVZEnwAGjMo5tlLWkWR"
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-05cd35b907b4ffe77"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/home/ubuntu/.ssh/id_rsa"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "/home/ubuntu/.ssh/id_rsa.pub"
}

variable "RDS_PASSWORD"{
    default = "tchgsar3"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-08edbb0e85d6a0a07"
  }
}

variable "INSTANCE_USERNAME"{
  default = "ubuntu"
}