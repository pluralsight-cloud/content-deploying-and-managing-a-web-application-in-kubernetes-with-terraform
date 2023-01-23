resource "kubernetes_storage_class" "mongo_sc" {
  metadata {
    name = "mongo-sc"

    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }
  
  storage_provisioner = "kubernetes.io/aws-ebs"
  reclaim_policy      = "Retain"
  parameters = {
    fsType = "ext4"
    type = "gp2"
  }
}

