### security group e liberação de porta
resource "aws_security_group" "bastiao" {
    name = "bastiao"
    vpc_id = aws_vpc.monitora-develop-vpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}
