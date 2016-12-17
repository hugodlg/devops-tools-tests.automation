job "apis-proxy" {
  datacenters = ["dc1"]

  type = "service"

  group "apis" {
    count = 1

    task "proxy" {
      driver = "docker"

      config {
        image = "docker-registry.service.private:5000/apis-proxy"

        port_map = {
          http = 80
        }
      }

      service {
        name = "apis-proxy"
        tags = ["apis"]

        port = "http"
      }

      resources {
        cpu    = 500
        memory = 128
        network {
          mbits = 10
          port "http" {
            static = "80"
          }
        }
      }
    }
  }
}
