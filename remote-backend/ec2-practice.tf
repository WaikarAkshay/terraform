#ssh-key
resource "aws_key_pair" "instance_key_pair" {
  key_name   = "my_key_pair"
  public_key = file("terra-instance-key.pub")
} 
#VPC
resource "aws_default_vpc" "default"{

}
#security-group
resource "aws_security_group" "my_security_group" {
  name        = "practice_security_group"
  description = "This will create a security group using terraform"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description="SSH Open"
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description="http port Open"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
#ec2
resource "aws_instance" "my_instance" {
  ami           = "ami-0fe18bc3cfa53a248"
  instance_type = "t3.micro"
  key_name = aws_key_pair.instance_key_pair.key_name
  vpc_security_group_ids = [
    aws_security_group.my_security_group.id   
  ]
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
    
    tags = {
        Name="my-ec2-instance"
    }


  }

  tags = {
    Name = "My-terraform-instnace"
  }
}

#instance-state
resource "aws_ec2_instance_state" "test" {
  instance_id = aws_instance.my_instance.id
  state       = "stopped"
}