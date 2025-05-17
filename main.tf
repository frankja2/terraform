terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.36.0"
    }
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig
}

variable "kubeconfig" {
  description = "Path to kubeconfig file"
  type        = string
}

resource "kubernetes_secret" "example" {
  metadata {
    name      = "my-secret"
    namespace = "default"   # lub inny namespace, jeśli chcesz
  }

  data = {
    # klucz = wartość base64-encoded!
    username = base64encode("admin")
    password = base64encode("superhaslo123")
  }

  type = "Opaque"
}
resource "kubernetes_secret" "test" {
  metadata {
    name = "my-test-secret"
    annotations = {
      "test/number" = "2"
    }
  }
  data = {
    foo = base64encode("bar")
  }
  type = "Opaque"
}
