##Criação de chave de comunicação
resource "aws_key_pair" "teste" {
    key_name = "bastiao"
    #public_key = "/root/.ssh/id_rsa.pub"
    public_key = "${file("/root/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "sebastiao" {
    #ami = "ami-00f8e2c955f7ffa9b"
    #instance_type = "t3.micro" 
    ami = var.imagem
    instance_type = var.instance
    tags = {Name = "sebastiao"}
    key_name = "bastiao"
    vpc_security_group_ids = [aws_security_group.bastiao.id]

    ebs_block_device {
      device_name = "/dev/sda1"
      volume_size = var.size
    }
}

