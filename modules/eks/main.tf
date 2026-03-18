terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
  }
}
resource "aws_eks_cluster" "main" {

  name = "${var.env}_eks_cluster"

  access_config {
    authentication_mode = "API"
    bootstrap_cluster_creator_admin_permissions= true
  }

  role_arn = aws_iam_role.cluster-role.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids = var.subnets
  }
}

resource "aws_eks_node_group" "main" {
  for_each = var.node_groups

  cluster_name    = aws_eks_cluster.main.name
  node_group_name = each.key
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = var.subnets
  instance_types  = each.value["instance_types"]

  scaling_config {
    desired_size = each.value["min_nodes"]
    max_size     = each.value["max_nodes"]
    min_size     = each.value["min_nodes"]
  }

}

resource "aws_eks_addon" "addons" {
  for_each = var.addons

  cluster_name = aws_eks_cluster.main.name
  addon_name   = each.key
}

resource "null_resource" "kubeconfig" {
  depends_on = [aws_eks_cluster.main]

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${aws_eks_cluster.main.name}"
  }
}


resource "null_resource" "metricserver" {
  depends_on = [aws_eks_cluster.main]

  provisioner "local-exec" {
    command = "kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.8.1/components.yaml"
  }
}


