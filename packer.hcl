
packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
 access_key = "AKIA32EIENFECUWC4ZTR"
  secret_key = "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"
  ami_name      = "ami-packer-image"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami = "ami-01216e7612243e0ef"
  ssh_username = "ec2-user"
}

build {
  name = "e2esa-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}