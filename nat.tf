resource "aws_eip" "external-ip" {
    domain = "vpc"
}

resource "aws_nat_gateway" "mi-nat" {

    subnet_id = aws_subnet.subred-1.id
    allocation_id = aws_eip.external-ip.id
    depends_on = [ aws_internet_gateway.gateway-1 ]
  
}