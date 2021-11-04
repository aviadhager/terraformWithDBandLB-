resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"


    # The VPC subnet
    subnt_id = aws_subnet.main-public-1.subnt_id

    # The security group
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    #The public SSH key
    key_name = aws_key_pair.mykeypair.key_name

    provisioner "file" {
        source      = "script.sh"
        destination = "/tmp/script.sh"
    }
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
            "sudo /tmp/script.sh",
        ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}


resource "aws_instance" "example-2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"


    # The VPC subnet
    subnt_id = aws_subnet.main-public-2.subnt_id

    # The security group
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    #The public SSH key
    key_name = aws_key_pair.mykeypair.key_name
    provisioner "file" {
      source      = "script.sh"
      destination = "/tmp/script.sh"
    }
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
            "sudo /tmp/script.sh",
        ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}
