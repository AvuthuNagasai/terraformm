

variable "image_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
  description = "RHEL-9 AMI ID" #optional
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "sg_name" {
  type = string
  default = "allow_ssh"
}

variable "sg_description" {
  default = "allowing SSH access"
  type = string
}

variable "ssh_port" {
  type = number
  default = 22
}

variable "protocol" {
  default = "tcp"
}

variable "allowed_cidr"{
  type = list(string)
  default = ["0.0.0.0/0"]

}





