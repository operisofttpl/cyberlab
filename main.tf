provider "aws" {
  region = "ap-southeast-1"  # Replace with your desired AWS region
}

# security group
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
    self = true
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    self = true
  }
}

resource "tls_private_key" "master-key-gen" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair of kali linux didnt have software
resource "aws_key_pair" "master-key-pair" {
  key_name   = var.keypair_name 
  public_key = tls_private_key.master-key-gen.public_key_openssh
}

# Kali stock server
resource "aws_instance" "kali_stock_server" {
  ami           = "ami-0c70ff2ee0a017c68"  # Replace with your desired AMI ID
  instance_type = "t3a.small"  # Replace with your desired instance type
  key_name      = aws_key_pair.master-key-pair.key_name
  subnet_id = "subnet-039a3303c1b1b15c6"
  availability_zone = "ap-southeast-1b"
  
  security_groups = [aws_security_group.master.id]
  
  tags = {
    Name = var.instance_name1
  }
}

# Kali with Burpsuite & Nessus
resource "aws_instance" "kali_modded" {
  ami           = "ami-0ca75e400a542b6d0"  # Replace with your desired AMI ID
  instance_type = "t3a.small"  # Replace with your desired instance type
  key_name      = aws_key_pair.master-key-pair.key_name
  subnet_id = "subnet-039a3303c1b1b15c6"
  availability_zone = "ap-southeast-1b"

  security_groups = [aws_security_group.master.id]
  
  tags = {
    Name = var.instance_name2
  }
}

# Basic Pentesting
resource "aws_instance" "basic_pentesting" {
  ami           = "ami-039009930521eb60a"  # Replace with your desired AMI ID
  instance_type = "t3a.small"  # Replace with your desired instance type
  key_name      = aws_key_pair.master-key-pair.key_name
  subnet_id = "subnet-039a3303c1b1b15c6"
  availability_zone = "ap-southeast-1b"

  security_groups = [aws_security_group.master.id]
  
  tags = {
    Name = var.instance_name4
  }
}

# Exploitable Windows
resource "aws_instance" "Windows-10-Pro" {
  ami           = "ami-03a0a9973f07ecac2"  # Replace with your desired AMI ID
  instance_type = "t3.medium"  # Replace with your desired instance type
  key_name      = aws_key_pair.master-key-pair.key_name
  subnet_id = "subnet-039a3303c1b1b15c6"
  availability_zone = "ap-southeast-1b"

  security_groups = [aws_security_group.master.id]

  tags = {
    Name = var.instance_name3
  }
}

resource "local_file" "local_key_pair" {
  filename = "${var.keypair_name}.pem"
  file_permission = "0400"
  content = tls_private_key.master-key-gen.private_key_pem
}

output "pem_file_for_ssh" {
  value = tls_private_key.master-key-gen.private_key_pem
  sensitive = true
}

output "kali_stock_server" {
  value = aws_instance.kali_stock_server.private_ip
}

output "kali_Burpsuite_Nessus" {
  value = aws_instance.kali_modded.private_ip
}

output "basic_Pentesting_Server" {
  value = aws_instance.basic_pentesting.private_ip
}

output "exploitable_Windows" {
  value = aws_instance.Windows-10-Pro.private_ip
}
output "exploitable_Windows_Username" {
  value = "Administrator"
}
output "exploitable_Windows_Password" {
  value = aws_instance.Windows-10-Pro.id
}

