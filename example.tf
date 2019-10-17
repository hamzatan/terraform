provider "aws" {
  profile    = "default"
  region     = var.region
}

resource "aws_instance" "example" {
  ami           = "ami-04070f04f450607dc"
  instance_type = "t2.micro"

  provisioner "local-exec"{
      command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  } 
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}
