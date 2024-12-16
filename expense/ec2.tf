# resource <resource-type> <resource-name>
resource "aws_instance" "db" {

  ami = var.image_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
      Module = var.instance_names[count.index]
    }
  )
}

  tags = {
    Name = "db"
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "allowing SSH access"

  #terraform block
  ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = var.protocol
    cidr_blocks      = var.allowed_cidr
  }

  egress {
    from_port        = 0 # from 0 to 0 means, opening all protocols
    to_port          = 0
    protocol         = var.protocol # -1 all protocols
    cidr_blocks      = var.allowed_cidr #["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
    CreatedBy = "Sai"
  }
}

