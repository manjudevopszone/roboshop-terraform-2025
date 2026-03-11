module "ec2" {
  for_each = var.db_instances
  source   = "./modules/ec2"

  ami_id                 = each.value["ami_id"]
  instance_type          = each.value["instance_type"]
  vpc_security_group_ids = var.vpc_security_group_ids
  zone_id                = var.zone_id
  env                    = var.env
  tag_name               = each.key
  vault_token            = var.vault_token
  docker_component_name  = lookup(each.value, "docker_component_name", each.key)

 # ansible_role            = lookup(each.value, "ansible_role", each.key)
#  key_name               = each.value["key_name"]
#  private_key_pem            = var.private_key_pem
}

module "eks" {
  for_each = var.eks
  source = "./modules/eks"

  env = var.env
  eks_version = each.value["eks_version"]
  subnets = each.value["subnets"]
  node_groups = each.value["node_groups"]
  addons = each.value["addons"]
}
