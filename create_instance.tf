provider "aws" {
  region     = "us-west-2"
  access_key = "*******************"
  secret_key = "**********************"
}
resource "aws_instance" "myec2" {

  ami           = "ami-03d5c68bab01:wq"
  instance_type = lookup (var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map(string)
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.medium"
  }
}
