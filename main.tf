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
