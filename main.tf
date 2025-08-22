provider "kubernetes" {
  config_path = "~/.kube/config"  # This is the default kubeconfig path for `kind`
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"  # Pass kubeconfig to helm provider
  }
}

resource "helm_release" "argo_cd" {
  name       = "argocd"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.51.6"  # Make sure to use the latest stable version

  create_namespace = true
}
