terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

variable "host" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

provider "kubernetes" {
  host = var.host

  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

resource "kubernetes_namespace" "pacman" {
  metadata {
    name = var.namespace
  }
}

variable "namespace" {
  description = "Kubernetes Namespace"
  type        = string
  default     = "pacman"
}

variable "DOCKER_USER" {
  description = "Docker User"
  type        = string
}

module "mongo-pvc-new" {
  source = "./modules"
  namespace  = var.namespace
  DOCKER_USER = var.DOCKER_USER
}

module "mongo-deployment-new" {
  source     = "./modules"
  namespace  = var.namespace
  DOCKER_USER = var.DOCKER_USER
  depends_on = [module.mongo-pvc-new]
}

module "pacman-service" {
  source     = "./modules"
  namespace  = var.namespace
  DOCKER_USER = var.DOCKER_USER
  depends_on = [module.mongo-deployment-new]
}

module "pacman-deployment-new" {
  source      = "./modules"
  namespace   = var.namespace
  DOCKER_USER = var.DOCKER_USER
  depends_on  = [module.pacman-service]
}
