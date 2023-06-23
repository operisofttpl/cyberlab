# Generates a secure private key and encodes it as PEM
# 1 key
resource "tls_private_key" "kali-without-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair of kali linux didnt have software
resource "aws_key_pair" "kali-without-key-pair" {
  key_name   = "kali-without-key-pair"  
  public_key = tls_private_key.kali-without-key-pair.public_key_openssh
}

# Save file
resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.kali-without-key-pair.key_name}.pem"
  content  = tls_private_key.kali-without-key-pair.private_key_pem
}

# Generates a secure private key and encodes it as PEM
# 2 key
resource "tls_private_key" "marlinspike-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair of kali software
resource "aws_key_pair" "marlinspike-key-pair" {
  key_name   = "marlinspike-key-pair"  
  public_key = tls_private_key.marlinspike-key-pair.public_key_openssh
}

# Save file
resource "local_file" "marlinspike-key-pair" {
  filename = "${aws_key_pair.marlinspike-key-pair.key_name}.pem"
  content  = tls_private_key.marlinspike-key-pair.private_key_pem
}

# Generates a secure private key and encodes it as PEM
# 3 key
resource "tls_private_key" "Metasploitable-vagrant-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair of Metasploitable-vagrant
resource "aws_key_pair" "Metasploitable-vagrant-key-pair" {
  key_name   = "Metasploitable-vagrant"  
  public_key = tls_private_key.Metasploitable-vagrant-key-pair.public_key_openssh
}

# Save file
resource "local_file" "Metasploitable-vagrant-key-pair" {
  filename = "${aws_key_pair.Metasploitable-vagrant-key-pair.key_name}.pem"
  content  = tls_private_key.Metasploitable-vagrant-key-pair.private_key_pem
}

# Generates a secure private key and encodes it as PEM
# 4 key
resource "tls_private_key" "Windows-10-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair
resource "aws_key_pair" "Windows-10-key-pair" {
  key_name   = "Windows-10-key-pair"  
  public_key = tls_private_key.Windows-10-key-pair.public_key_openssh
}

# Save file
resource "local_file" "Windows-10-key-pair" {
  filename = "${aws_key_pair.Windows-10-key-pair.key_name}.pem"
  content  = tls_private_key.Windows-10-key-pair.private_key_pem
}

# Generates a secure private key and encodes it as PEM
# 5 key
resource "tls_private_key" "kali-demo-key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair
resource "aws_key_pair" "kali-demo-key_pair" {
  key_name   = "kali-demo-key_pair"  
  public_key = tls_private_key.kali-demo-key_pair.public_key_openssh
}

# Save file
resource "local_file" "kali-demo-key_pair" {
  filename = "${aws_key_pair.kali-demo-key_pair.key_name}.pem"
  content  = tls_private_key.kali-demo-key_pair.private_key_pem
}




output "kali-soft-key" {
  value = tls_private_key.kali-demo-key_pair.public_key_openssh
}

output "window-server-key" {
  value = tls_private_key.Windows-10-key-pair.public_key_openssh
}

output "metasploitable-server-key" {
  value = tls_private_key.Metasploitable-vagrant-key-pair.public_key_openssh
}

output "marlinspike-key" {
  value = tls_private_key.marlinspike-key-pair.public_key_openssh
}

output "kali-server-key" {
  value = tls_private_key.kali-without-key-pair.public_key_openssh
}
