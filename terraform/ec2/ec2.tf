##Criação de chave de comunicação
resource "aws_key_pair" "teste" {
    key_name = "teste2"
    #public_key = "/root/.ssh/id_rsa.pub"
    public_key = "${file("/root/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "centos7" {
    #ami = "ami-00f8e2c955f7ffa9b"
    #instance_type = "t3.micro" 
    ami = var.imagem
    instance_type = var.instance
    tags = {Name = "teste"}
    key_name = "teste2"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}
resource "aws_ebs_volume" "ebs" {
    #availability_zone = var.region
    size = var.size
}

