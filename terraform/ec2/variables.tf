variable "region" {
default     = "us-east-1"
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
    default = "8"
}

variable "imagem" {
    default = "ami-00e87074e52e6c9f9"
}

