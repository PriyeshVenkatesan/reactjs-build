terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  shared_config_files      = ["/root/.aws/config"]
  shared_credentials_files = ["/root/.aws/credentials"]
  #profile                  = "default"
}

resource "aws_instance" "Web_server" {
  ami                    = "ami-0f58b397bc5c1f2e8"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-000bef1fc959fb341"]
  key_name               = "guviproject"
  root_block_device {
    volume_size = 20    # Size of the root volume in GiB
    volume_type = "gp2" # General Purpose SSD (default)
  }
user_data = <<-EOF
#!/bin/bash

#Clone Git
sudo mkdir /root/app
     cd /root/app
#git clone git@github.com:PriyeshVenkatesan/reactjs-build.git
git clone https://github.com/PriyeshVenkatesan/reactjs-build.git

# Install Docker
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#sudo docker run hello-world

sudo docker info


# install Docker Compose

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


sudo chmod +x /usr/local/bin/docker-compose


docker-compose --version

cd /root/app/reactjs-build
# Deploying ReactJs App
./deploy.sh

EOF

  tags = {
    Name = "ReactJSShoppingAppInstance"
  }
}
output "instance_id" {
  value = aws_instance.Web_server.id
}
output "public_ip" {
  value = aws_instance.Web_server.public_ip
}
