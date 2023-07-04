resource "aws_instance" "mi-primera-instancia" {
  ami           = data.aws_ami.Ubuntu_latest.id
  instance_type = "t2.micro"
  
  vpc_security_group_ids = [aws_security_group.Mi-Primer-SG.name]
  subnet_id = aws_subnet.subred-1.id

  key_name = aws_key_pair.clave-ssh-curso.key_name

  tags = {
    Name = "mi-primera-instancia"
  }
}

output "public_ip" {
  value = aws_instance.mi-primera-instancia.public_ip
}

resource "aws_key_pair" "clave-ssh-curso"{
  key_name = "terraform-ssh-2"
  public_key = file(var.AWS_PUBLIC_KEY)

}


data "aws_ami" "Ubuntu_latest"{

  most_recent = true
  owners = ["099720109477"]

  filter {

    name = "virtualization-type"
    values = ["hvm"]
    
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  filter{
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22*"]

  }

}
