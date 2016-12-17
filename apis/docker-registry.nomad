job "docker-registry" {
  datacenters = ["dc1"]

  type = "service"

  group "docker" {
    count = 1

    task "registry" {
      driver = "docker"

      artifact {
        source      = "./docker-registry/certs.tar.gz"
        destination = "/"
      }

      config {
        image = "registry"

        port_map = {
          registry = 5000
        }

        args = [
          "REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt",
          "REGISTRY_HTTP_TLS_KEY=/certs/domain.key"
        ]
      }

      service {
        name = "docker-registry"
        tags = ["apis"]

        port = "registry"
      }

      resources {
        cpu    = 500
        memory = 128
        network {
          mbits = 10
          port "registry" {
            static = "5000"
          }
        }
      }
    }
  }
}
