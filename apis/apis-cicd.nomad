job "apis-cicd" {
  datacenters = ["dc1"]

  type = "service"

  group "apis" {
    count = 1

    task "cicd" {
      driver = "docker"

      config {
        image = "jenkins"

        port_map = {
          http = 8080
        }
      }

      service {
        name = "apis-cicd"
        tags = ["apis"]

        port = "http"
      }

      resources {
        cpu    = 500
        memory = 256
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
