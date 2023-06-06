resource "aws_instance" "mi-primera-instancia" {
  ami           = data.aws_ami.Ubuntu_latest.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.clave-ssh-curso.key_name

  security_groups = ["default","permitir-ssh"]

  tags = {
    Name = "mi-primera-instancia"
  }
}

output "public_ip" {
  value = aws_instance.mi-primera-instancia.public_ip
}

resource "aws_key_pair" "clave-ssh-curso"{
  key_name = "terraform-ssh"
  public_key = file(var.AWS_PUBLIC_KEY)

}


data "aws_ami" "Ubuntu_latest"{

  most_recent = true
  owners = ["099720109477"]

  filter {

    name = "virtualization-type"
    values = ["hvm"]
    
  }

  filter{
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-kinetic-22.10-arm64-server-*"]

  }

}