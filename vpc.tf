resource "aws_vpc" "primera-vpc"{

    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"

    tags = {
      name = "Primer VPC"
    }

}

resource "aws_subnet" "subred-1"{
    vpc_id = aws_vpc.primera-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1"
    map_public_ip_on_launch = "true"

    tags = {
        name = "Subred 1"
    }
}

resource "aws_internet_gateway" "gateway-1" {

    vpc_id = aws_vpc.primera-vpc.id


    tags = {
      name = "Gateway 1"
    }
  
}

resource "aws_route_table" "tabla-de-enrutamiento"{
    vpc_id = aws_vpc.primera-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gateway-1.id
    }
}