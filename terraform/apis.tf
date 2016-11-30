resource "digitalocean_droplet" "apis" {
    count = 2
    image = "centos-7-x64"
    name = "${format("apis%d.z1", count.index)}"
    region = "sfo1"
    size = "512mb"
    private_networking = true
    ssh_keys = [
      "04:81:27:16:32:1e:cf:b2:b3:46:6a:07:96:27:5b:8b"
    ]
}
