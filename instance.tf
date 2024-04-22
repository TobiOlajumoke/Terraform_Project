resource "aws_instance" "web_server" {
  ami           = "ami-0fe630eb857a6ec83"
  instance_type = "t2.micro"
  subnet_id     = "subnet-06f4bafe1bde4ed61"
  security_groups = ["${aws_security_group.web_server_sg.name}"]

  tags = {
    EnvName = "Test Environment"
  }
}