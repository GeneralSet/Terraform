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
}