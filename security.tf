resource "aws_security_group" "Mi-Primer-SG" {

    name        = "allow_http"
    description = "Allow HTTP inbound traffic"

    ingress {
        description      = "HTTP from everywhere"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    egress {

        description     = "Allow to send to everywhere"
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]


    }
  
  
}