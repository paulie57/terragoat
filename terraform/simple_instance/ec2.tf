provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "7bc0eb78fe181bd6c5ab0a5dca0127d3de895de3"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-10 16:02:26"
    git_last_modified_by = "89462584+paulie57@users.noreply.github.com"
    git_modifiers        = "89462584+paulie57"
    git_org              = "paulie57"
    git_repo             = "terragoat"
    yor_trace            = "1ad2e64d-3461-47a0-943f-835ee54fa4f0"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "7bc0eb78fe181bd6c5ab0a5dca0127d3de895de3"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-10 16:02:26"
    git_last_modified_by = "89462584+paulie57@users.noreply.github.com"
    git_modifiers        = "89462584+paulie57"
    git_org              = "paulie57"
    git_repo             = "terragoat"
    yor_trace            = "6425a749-fa1d-4570-96a7-e248a538dc9e"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
