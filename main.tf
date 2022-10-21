data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]

}

resource "aws_instance" "jenkins" {
  ami             = data.aws_ami.amazon-linux-2.id
  instance_type   = var.INSTANCE_TYPE //"t2.medium"
  security_groups = [aws_security_group.jenkins-sg.name]
  key_name        = "Jenkins-key"
  provisioner "remote-exec" {
    inline = [
        "sudo yum update -y",
        "sudo amazon-linux-extras install docker -y",
        "sudo service docker start",
        "sudo systemctl enable docker",
        "sudo usermod -a -G docker ec2-user",
        "sudo service docker stop",
        "sudo service docker start",
        "sudo docker pull jenkins/jenkins:lts",
        "sudo docker network create jenkins-network",
        "sudo docker run --name jenkins-tst   --detach --restart unless-stopped   --network jenkins-network   --user root   --volume /opt/jenkins_home:/var/jenkins_home   --volume /var/run/docker.sock:/var/run/docker.sock   --publish 8080:8080 --publish 50000:50000   jenkins/jenkins:lts",
      ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("jenkins-key.pem")
  }
  tags = {
    "Name" = "Jenkins"
  }
}