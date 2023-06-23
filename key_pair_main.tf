# Generates a secure private key and encodes it as PEM
# 1 key
resource "tls_private_key" "master-key-gen" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair of kali linux didnt have software
resource "aws_key_pair" "master-key-pair" {
  key_name   = var.keyname  
  public_key = tls_private_key.master-key-gen.public_key_openssh
}

output "master-key" {
  value = tls_private_key.master-key-pair.public_key
}
