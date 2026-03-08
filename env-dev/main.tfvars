db_instances = {
  mongodb = {
    ami_id        = "ami-0220d79f3f480ecf5"
    instance_type = "t3.small"
  }
  # catalogue = {
  #   ami_id                = "ami-0220d79f3f480ecf5"
  #   instance_type         = "t3.small"
  #   docker_component_name = "catalogue-docker"
  # }
  # frontend = {
  #   ami_id                = "ami-0220d79f3f480ecf5"
  #   instance_type         = "t3.small"
  #   docker_component_name = "frontend-docker"
  # }
  # cart = {
  #   ami_id                = "ami-0220d79f3f480ecf5"
  #   instance_type         = "t3.small"
  #   docker_component_name = "catalogue-docker"
  # }
  mysql = {
    ami_id        = "ami-0220d79f3f480ecf5"
    instance_type = "t3.small"
  }
  # shipping = {
  #   ami_id        = "ami-0220d79f3f480ecf5"
  #   instance_type = "t3.small"
  #    docker_component_name = "shipping-docker"
  # }
  redis = {
    ami_id        = "ami-0220d79f3f480ecf5"
    instance_type = "t3.small"
  }
  # payment = {
  #   ami_id        = "ami-0220d79f3f480ecf5"
  #   instance_type = "t3.small"
  #    docker_component_name = "payment-docker"
  # }
  # user = {
  #   ami_id        = "ami-0220d79f3f480ecf5"
  #   instance_type = "t3.small"
  # docker_component_name = "user-docker"
  # }
  rabbitmq = {
    ami_id        = "ami-0220d79f3f480ecf5"
    instance_type = "t3.small"
  }
  # dispatch = {
  #   ami_id        = "ami-0220d79f3f480ecf5"
  #   instance_type = "t3.small"
  # docker_component_name = "dispatch-docker"
  # }
}

zone_id = "Z08819072319VLT801BHA"
vpc_security_group_ids = ["sg-043ff9d2da877c20a"]
env = "dev"
#private_key_pem = "/home/ec2-user/roboshop-key.pem"



eks = {
  main = {
    subnets     = ["subnet-0563c99ae150cdb89", "subnet-01a95952043ef86f1"]
    eks_version = 1.35
    node_groups = {
      main = {
        min_nodes = 2
        max_nodes = 10
        instance_types = ["t3.medium","t3.small"]
        tag_name = "cluster_node_1"
      }
    }
    addons = {
      metrics-server = {}
    }
  }
}

