resource "digitalocean_droplet" "apis-gateways" {
  count = 1
  image = "centos-7-x64"
  name = "${format("g%d.apis.z1", count.index)}"
  region = "sfo1"
  size = "512mb"
  private_networking = true
  ssh_keys = [
    "a6:41:2b:79:dc:1c:4f:26:2a:99:e3:f3:41:1e:24:b5"
  ]
}
