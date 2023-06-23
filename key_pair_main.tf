# Generates a secure private key and encodes it as PEM
# 1 key
resource "tls_private_key" "kali-without-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair of kali linux didnt have software
resource "aws_key_pair" "kali-without-key-pair" {
  key_name   = var.keyname  
  public_key = tls_private_key.kali-without-key-pair.public_key_openssh
}

# Generates a secure private key and encodes it as PEM
# 2 key
resource "tls_private_key" "marlinspike-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair of kali software
resource "aws_key_pair" "marlinspike-key-pair" {
  key_name   = var.keyname2
  public_key = tls_private_key.marlinspike-key-pair.public_key_openssh
}

# Generates a secure private key and encodes it as PEM
# 3 key
resource "tls_private_key" "Metasploitable-vagrant-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair of Metasploitable-vagrant
resource "aws_key_pair" "Metasploitable-vagrant-key-pair" {
  key_name   =  var.keyname3
  public_key = tls_private_key.Metasploitable-vagrant-key-pair.public_key_openssh
}

# Generates a secure private key and encodes it as PEM
# 4 key
resource "tls_private_key" "Windows-10-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair
resource "aws_key_pair" "Windows-10-key-pair" {
  key_name   = var.keyname4
  public_key = tls_private_key.Windows-10-key-pair.public_key_openssh
}

# Generates a secure private key and encodes it as PEM
# 5 key
resource "tls_private_key" "kali-demo-key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair
resource "aws_key_pair" "kali-demo-key_pair" {
  key_name   = var.keyname5
  public_key = tls_private_key.kali-demo-key_pair.public_key_openssh
}





output "kali-soft-key" {
  value = aws_key_pair.kali-demo-key_pair.key_name
}

output "window-server-key" {
  value = aws_key_pair.Windows-10-key-pair.key_name
}

output "metasploitable-server-key" {
  value = aws_key_pair.Metasploitable-vagrant-key-pair.key_name
}

output "marlinspike-key" {
  value = aws_key_pair.marlinspike-key-pair.key_name
}

output "kali-server-key" {
  value = aws_key_pair.kali-without-key-pair.key_name
}
