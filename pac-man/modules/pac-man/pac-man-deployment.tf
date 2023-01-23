resource "kubernetes_deployment" "pac-man" {
  metadata {
    name = "pac-man"
    namespace = var.kubernetes_namespace

    labels = {
      name = "pac-man"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "pac-man"
      }
    }

    template {
      metadata {
        labels = {
          name = "pac-man"
        }
      }

      spec {
        container {
          name  = "pac-man"
          #image = "quay.io/ifont/pacman-nodejs-app:latest"
          image = "docker.io/jessehoch/pacman-nodejs-app:latest"

          port {
            name           = "http-server"
            container_port = 8080
          }
        }
      }
    }
  }
}

