# Criação das VCNs
resource "aws_vpc" "monitora-develop-vpc" {
  cidr_block           = var.monitora-develop-vpc
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "monitora-develop-vpc"
    Time = "DevSecOps"
    Ambiente = "Desenvolvimento"
    Cliente = "Monitora"
    Responsavel = "Elis Hernandes"
}
} 

# Criação das Sub-redes e ACLs

#Privadas
resource "aws_subnet" "monitora-develop-subnet-pvt" {
  vpc_id                  = aws_vpc.monitora-develop-vpc.id
  cidr_block              = var.monitora-develop-subnet-pvt
  map_public_ip_on_launch = var.mapPublicIP  
  availability_zone       = var.availabilityZone1a

tags = {
    Name = "monitora-develop-subnet-pvt"
    Time = "DevSecOps"
    Ambiente = "Desenvolvimento"
    Cliente = "Monitora"
    Responsavel = "Elis Hernandes"
}
}

resource "aws_network_acl" "monitora-develop-pvt-nacl" {
  vpc_id = aws_vpc.monitora-develop-vpc.id
  subnet_ids = [ aws_subnet.monitora-develop-subnet-pvt.id ]
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = var.pvt-dest-CIDR-1
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = var.pvt-dest-CIDR-1
    from_port  = 0
    to_port    = 0
  }
  
tags = {
    Name = "monitora-develop-pvt-nacl"
}
}

# Publicas 
resource "aws_subnet" "monitora-develop-subnet-pub" {
  vpc_id                  = aws_vpc.monitora-develop-vpc.id
  cidr_block              = var.monitora-develop-subnet-pub
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone1b
tags = {
    Name = "monitora-develop-subnet-pub"
    Time = "DevSecOps"
    Ambiente = "Desenvolvimento"
    Cliente = "Monitora"
    Responsavel = "Elis Hernandes"
}
}

resource "aws_network_acl" "monitora-develop-pub-nacl" {
  vpc_id = aws_vpc.monitora-develop-vpc.id
  subnet_ids = [ aws_subnet.monitora-develop-subnet-pub.id ]
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = var.pub-dest-CIDR-1 
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = var.pub-dest-CIDR-1
    from_port  = 0
    to_port    = 0
  }
  
tags = {
    Name = "monitora-develop-pub-nacl"
}
}

# Criação dos Internet Gateways
resource "aws_internet_gateway" "monitora-develop-igw" {
 vpc_id = aws_vpc.monitora-develop-vpc.id
 tags = {
        Name = "monitora-develop-igw"
}
} 

#Criação das Tabelas de Roteamento

resource "aws_route_table" "monitora-develop-rotable" {
 vpc_id = aws_vpc.monitora-develop-vpc.id
 tags = {
        Name = "monitora-develop-rotable"
}
} 

# Criação das Rotas

resource "aws_route" "monitora-develop-pub-route" {
  route_table_id         = aws_route_table.monitora-develop-rotable.id
  destination_cidr_block = var.pub-dest-CIDR-1
  gateway_id             = aws_internet_gateway.monitora-develop-igw.id
}

# Criação das Tabelas de associação de Rotas

resource "aws_route_table_association" "monitora-develop-pub-rotable-association" {
  subnet_id      = aws_subnet.monitora-develop-subnet-pub.id
  route_table_id = aws_route_table.monitora-develop-rotable.id
}

