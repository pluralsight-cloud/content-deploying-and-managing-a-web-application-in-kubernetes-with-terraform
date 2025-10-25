terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.61"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }

    time = {
      source  = "hashicorp/time"
      version = ">= 0.9"
    }

  }

  required_version = "~> 1.3"
}