resource "aws_instance" "mi-primera-instancia" {
  ami           = "ami-04cbc90abb08f0321"
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