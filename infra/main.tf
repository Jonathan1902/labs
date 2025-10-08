resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "my-keypair"

  tags = {
    Name = "jonnies"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/inventory/hosts.ini"
  }
}