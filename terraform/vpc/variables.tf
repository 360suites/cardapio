#VARIAVEIS DO ARQUIVO main.tf

#Vars "region"

variable "region" {
    default = "us-east-1"
}

variable "profile" {
  default = "luciano.ferreira"
}

#VARIAVEIS ARQUIVO vpc.tf

#Vars "aws_vpc" ###############################################
variable "monitora-develop-vpc" {
    default = "10.0.0.0/19"
}
variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}

#Vars "aws_subnet" #############################################
variable "monitora-develop-subnet-pvt" {
    default = "10.0.5.0/24"
}
variable "monitora-develop-subnet-pub"{
    default = "10.0.6.0/24"
}
variable "mapPublicIP" {
    default = true
}
variable "availabilityZone1a" {
    default = "us-east-1a"
}
variable "availabilityZone1b"{
    default = "us-east-1b"
}
variable "availabilityZone1c" {
    default = "us-east-1c"
}
variable "availabilityZone1d"{
    default = "us-east-1d"
}
variable "availabilityZone1e"{
    default = "us-east-1e"
}

#Vars "aws_network_acl" #########################################
variable "pub-dest-CIDR-1" {
    default = "0.0.0.0/0"
}
variable "pvt-dest-CIDR-1" {
    default = "10.0.0.0/19"
}
variable "localdestCIDRblock" {
    default = ""
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
#Vars "aws_internet_gateway" ######################################

#Vars "aws_route_table" ###########################################
 
#Vars "aws_route" #################################################

