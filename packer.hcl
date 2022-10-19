
packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
 access_key = "AKIASRQT5TDFKGMFFZ5W"
  secret_key = "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"
  ami_name      = "ami-packer-image"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami = "ami-01216e7612243e0ef"
  ssh_username = "ec2-user"
}

build {
  name = "e2esa-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}