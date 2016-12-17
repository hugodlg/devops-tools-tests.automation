job "docker-registry" {
  datacenters = ["dc1"]

  type = "service"

  group "docker" {
    count = 1

    task "registry" {
      driver = "docker"

      artifact {
        source = "https://github.com/hugodlg/devops-tools-tests.automation/raw/master/apis/docker-registry/certs.tar.gz"
      }

      config {
        image = "registry"

        port_map = {
          registry = 5000
        }
      }

      env = {
        "REGISTRY_HTTP_TLS_CERTIFICATE" = "/local/certs/domain.crt"
        "REGISTRY_HTTP_TLS_KEY" = "/local/certs/domain.key"
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
