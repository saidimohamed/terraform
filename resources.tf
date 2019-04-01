
data "aws_ami" "centos" {
  most_recent = true

  filter {
      name   = "name"
      values = ["CentOS Linux 7 x86_64 *"]
  }

  filter {
      name   = "architecture"
      values = ["x86_64"]
  }

  filter {
      name   = "root-device-type"
      values = ["ebs"]
  }
 owners = ["679593333241"]
}

resource "aws_instance" "test" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  subnet_id = "subnet-0db3655fa8f7380b8"
  key_name = "ansible_Key"
  associate_public_ip_address = true
#  user_data = "${file("user_data.sh")}"

  root_block_device {
    delete_on_termination = true
 }
  tags = {
    Name = "MSTest"
  }
}


resource "aws_instance" "test2" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  subnet_id = "subnet-0db3655fa8f7380b8"
  key_name = "ansible_Key"
  associate_public_ip_address = true
  root_block_device {
    delete_on_termination = true
 }
  tags = {
    Name = "MSTest2"
  }
}

