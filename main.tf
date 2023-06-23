variable "instance_name" {
  type  = string
  default  = "kali-withoutSoft"
}

variable "instance_name2" {
  type  = string
  default  = "kaliLinux_demo"
}

variable "instance_name3" {
  type  = string
  default  = "Metasploitable-vagrant"
}

variable "instance_name4" {
  type  = string  
  default  = "Windows-10-Pro"
}

variable "instance_name5" {
  type  = string
  default  = "marlinspike"
}

provider "aws" {
  region = "ap-southeast-1"  # Replace with your desired AWS region
}


resource "aws_instance" "kali_without" {
  ami           = "ami-00a1eb7c6c201ccfb"  # Replace with your desired AMI ID
  instance_type = "t3a.large"  # Replace with your desired instance type
  key_name      = aws_key_pair.kali-without-key-pair.key_name
  associate_public_ip_address = false

  vpc_security_group_ids = ["sg-0c35ee97985a1bb95"]
  
  tags = {
    Name = var.instance_name
  }
}

resource "aws_instance" "kali_demo" {
  ami           = "ami-0cc0350d6bfe6bf87"  # Replace with your desired AMI ID
  instance_type = "t3a.xlarge"  # Replace with your desired instance type
  key_name      = aws_key_pair.kali-demo-key_pair.key_name
  associate_public_ip_address = false

  vpc_security_group_ids = ["sg-0c35ee97985a1bb95"]
  
  tags = {
    Name = var.instance_name2
  }
}

resource "aws_instance" "Metasploitable-vagrant" {
  ami           = "ami-0a1c4f08269669288"  # Replace with your desired AMI ID
  instance_type = "t3a.xlarge"  # Replace with your desired instance type
  key_name      = aws_key_pair.Metasploitable-vagrant-key-pair.key_name
  associate_public_ip_address = false

  vpc_security_group_ids = ["sg-0c35ee97985a1bb95"]
  
  tags = {
    Name = var.instance_name3
  }
}

resource "aws_instance" "Windows-10-Pro" {
  ami           = "ami-00a1eb7c6c201ccfb"  # Replace with your desired AMI ID
  instance_type = "t3a.xlarge"  # Replace with your desired instance type
  key_name      = aws_key_pair.Windows-10-key-pair.key_name
  associate_public_ip_address = false

  vpc_security_group_ids = ["sg-0c35ee97985a1bb95"]

  tags = {
    Name = var.instance_name4
  }
}

resource "aws_instance" "marlinspike" {
  ami           = "ami-039009930521eb60a"  # Replace with your desired AMI ID
  instance_type = "t3a.large"  # Replace with your desired instance type
  key_name      = aws_key_pair.marlinspike-key-pair.key_name
  associate_public_ip_address = false

  vpc_security_group_ids = ["sg-0c35ee97985a1bb95"]
  
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




