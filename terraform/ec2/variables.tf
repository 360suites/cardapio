variable "region" {
default     = "us-east-2"
description = "Main region"
}
variable "profile" {
  default = "luciano.ferreira"
}
#variable "tags" {
#	type = map
#}

variable "instance" {
    default = "t3.micro"
}

variable "size" {
    size = "40"
}

variable "imagem" {
    default = "ami-00f8e2c955f7ffa9b"
}

