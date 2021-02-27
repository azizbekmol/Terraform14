resource "null_resource" "script" {
    provisioner "remote-exec" {
        inline = [
            "sudo yum install httpd -y",
            "sudo systemctl start httpd",
            "sudo yum install telnet -y"
        ]

    connection {
        type    = "ssh"
        user    = "centos"
        private_key = file("~/.ssh/id_rsa")
        host    = aws_instance.web.public_ip
    }
    }
  provisioner "file" {
      source = "user.sh"
      destination = "/tmp/user.sh"
      
    connection {
        type    = "ssh"
        user    = "centos"
        private_key = file("~/.ssh/id_rsa")
        host    = aws_instance.web.public_ip
    }
  }
}
