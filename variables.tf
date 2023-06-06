variable "AWS_KEY" {
}
variable "AWS_SECRET_KEY" {  
}
variable "AWS_SESSION_TOKEN" {  
}
variable "AWS_REGION"{
    default = "us-east-1"
}

variable "AWS_PUBLIC_KEY"{
    default = "./curso-terraform.pub"
}

variable "ubuntu-22-ami"{

    type = map
    default = {
        us-east-1 = "ami-000215d5ae5531bb4"
        us-east-2 = "ami-08fdd91d87f63bb09"
    }

}