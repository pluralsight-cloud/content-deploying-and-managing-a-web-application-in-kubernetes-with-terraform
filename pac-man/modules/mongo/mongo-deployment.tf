resource "kubernetes_deployment" "mongo" {
  metadata {
    name = "mongo"
    namespace = var.kubernetes_namespace

    labels = {
      name = "mongo"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "mongo"
      }
    }

    template {
      metadata {
        labels = {
          name = "mongo"
        }
      }

      spec {
        volume {
          name = "mongo-db"

          persistent_volume_claim {
            claim_name = "mongo-storage"
          }
        }

        container {
          name  = "mongo"
          image = "mongo"

          port {
            name           = "mongo"
            container_port = 27017
          }

          volume_mount {
            name       = "mongo-db"
            mount_path = "/mnt/data/db"
          }
        }
      }
    }
  }
}

