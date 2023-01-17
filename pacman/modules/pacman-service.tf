resource "kubernetes_service" "pacman" {
  metadata {
    name      = "pacman"
    namespace = var.namespace

    labels = {
      name = "pacman"
    }
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 80
      target_port = "8080"
    }

    selector = {
      name = "pacman"
    }

    type = "LoadBalancer"
  }
}

