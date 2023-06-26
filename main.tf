provider "aws" {
  region = "ap-southeast-1"  # Replace with your desired AWS region
}




# Master security group
resource "aws_security_group" "master" {
  vpc_id = "vpc-0a990671911c535f8"

# port 22 for ssh conection
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# port 3306 for db connection
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# open to all
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# worker security group
resource "aws_security_group" "master" {
  vpc_id = "vpc-0a990671911c535f8"

# port 22 for ssh conection
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# port 3306 for db connection
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# open to all
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    security_groups = ["${aws_security_group.master.id}"]
  }
}



resource "aws_instance" "kali_without" {
  ami           = "ami-00a1eb7c6c201ccfb"  # Replace with your desired AMI ID
  instance_type = "t3a.large"  # Replace with your desired instance type
  key_name      = aws_key_pair.kali-without-key-pair.key_name
  subnet_id = "subnet-039a3303c1b1b15c6"
  availability_zone = "ap-southeast-1b"
  
  security_groups = [aws_security_group.worker.id]
  
  tags = {
    Name = var.instance_name
  }
}

resource "aws_instance" "kali_demo" {
  ami           = "ami-0cc0350d6bfe6bf87"  # Replace with your desired AMI ID
  instance_type = "t3a.xlarge"  # Replace with your desired instance type
  key_name      = aws_key_pair.kali-demo-key_pair.key_name
  subnet_id = "subnet-039a3303c1b1b15c6"
  availability_zone = "ap-southeast-1b"

  security_groups = [aws_security_group.worker.id]
  
  tags = {
    Name = var.instance_name2
  }
}


resource "aws_instance" "Windows-10-Pro" {
  ami           = "ami-00a1eb7c6c201ccfb"  # Replace with your desired AMI ID
  instance_type = "t3a.xlarge"  # Replace with your desired instance type
  key_name      = aws_key_pair.Windows-10-key-pair.key_name
  subnet_id = "subnet-039a3303c1b1b15c6"
  availability_zone = "ap-southeast-1b"

  security_groups = [aws_security_group.worker.id]

  tags = {
    Name = var.instance_name4
  }
}

resource "aws_instance" "marlinspike" {
  ami           = "ami-039009930521eb60a"  # Replace with your desired AMI ID
  instance_type = "t3a.large"  # Replace with your desired instance type
  key_name      = aws_key_pair.marlinspike-key-pair.key_name
  subnet_id = "subnet-039a3303c1b1b15c6"
  availability_zone = "ap-southeast-1b"

  security_groups = [aws_security_group.worker.id]
  
  tags = {
    Name = var.instance_name5
  }
}


# output "ssh_public_key" {
#   value = tls_private_key.key_pair.public_key_openssh
# }

output "private_ip_address_kali_without_soft" {
  value = aws_instance.kali_without.private_ip
}
output "private_ip_address_marlinspike" {
  value = aws_instance.marlinspike.private_ip
}
output "private_ip_address_Windows_10_pr" {
  value = aws_instance.Windows-10-Pro.private_ip
}
output "private_ip_address23" {
  value = aws_instance.Metasploitable-vagrant.private_ip
}
output "private_ip_address4" {
  value = aws_instance.kali_demo.private_ip
}




