resource "digitalocean_droplet" "apis-nodes" {
  count = 2
  image = "centos-7-x64"
  name = "${format("n%d.apis.z1", count.index)}"
  region = "sfo1"
  size = "512mb"
  private_networking = true
  ssh_keys = [
    "a6:41:2b:79:dc:1c:4f:26:2a:99:e3:f3:41:1e:24:b5"
  ]
}
