resource "kubernetes_persistent_volume_claim" "mongo_storage" {
  metadata {
    name      = "mongo-storage"
    namespace = var.namespace
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "8Gi"
      }
    }
  }
}

