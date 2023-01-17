resource "kubernetes_deployment" "pacman" {
  metadata {
    name      = "pacman"
    namespace = var.namespace

    labels = {
      name = "pacman"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "pacman"
      }
    }

    template {
      metadata {
        labels = {
          name = "pacman"
        }
      }

      spec {
        container {
          name  = "pacman"
          image = "${var.DOCKER_USER}/pacman-nodejs-app:latest"

          port {
            name           = "http-server"
            container_port = 8080
          }
        }
      }
    }
  }
}

