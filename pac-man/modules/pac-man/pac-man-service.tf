resource "kubernetes_service" "pac-man" {
  metadata {
    name = "pac-man"
    namespace = var.kubernetes_namespace

    labels = {
      name = "pac-man"
    }
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 80
      target_port = "8080"
    }

    selector = {
      name = "pac-man"
    }

    type = "LoadBalancer"
  }
}

