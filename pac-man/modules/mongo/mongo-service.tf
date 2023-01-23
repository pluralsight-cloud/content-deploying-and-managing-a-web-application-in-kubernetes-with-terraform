resource "kubernetes_service" "mongo" {
  metadata {
    name = "mongo"
    namespace = var.kubernetes_namespace

    labels = {
      name = "mongo"
    }
  }

  spec {
    port {
      port        = 27017
      target_port = "27017"
    }

    selector = {
      name = "mongo"
    }

    type = "LoadBalancer"
  }
}

