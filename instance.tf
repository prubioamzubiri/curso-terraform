resource "aws_instance" "mi-primera-instancia" {
  count         = "5"
  ami           = "ami-04cbc90abb08f0321"
  instance_type = "t2.micro"

  security_groups = ["default"]

  tags = {
    name = "instancia-${count.index}"
  }

}

