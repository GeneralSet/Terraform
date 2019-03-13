resource "digitalocean_droplet" "multiplayer" {
  image = "docker-18-04"
  name = "multiplayer-1"
  region = "sfo2"
  size = "s-1vcpu-1gb"
  ssh_keys= ["${var.do_key_id}"]

  connection {
    user = "root"
    type = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/user/bin",
      # install nginx
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }
}
