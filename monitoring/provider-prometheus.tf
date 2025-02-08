terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }

    kubernetes = {
        version = ">= 2.0.0"
        source = "hashicorp/kubernetes"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

# Fetch EKS cluster information for 'my-eks-cluster'
data "aws_eks_cluster" "my_eks_cluster" {
  name = "my-eks-cluster"
}

# Fetch authentication information for 'my-eks-cluster'
data "aws_eks_cluster_auth" "my_eks_cluster_auth" {
  name = "my-eks-cluster"
}

# AWS provider configuration for region 'us-east-1'
provider "aws" {
  region = "us-east-1"
}

# Helm provider configuration
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Kubernetes provider configuration
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Kubectl provider configuration
provider "kubectl" {
  load_config_file = false
  host                   = data.aws_eks_cluster.my_eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.my_eks_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.my_eks_cluster_auth.token
  config_path = "~/.kube/config"
}

