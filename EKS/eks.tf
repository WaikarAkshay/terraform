module "EKS" {
    source = "terraform-aws-modules/eks/aws"
    version = "~> 21.0"

    name = local.cluster_name
    kubernetes_version = var.cluster_version
    endpoint_private_access = true
    endpoint_public_access = true
    enable_cluster_creator_admin_permissions = true
    addons = {
        coredns = {
            most_recent = true
        }
        kube-proxy = {
            most_recent = true
        }
        vpc-cni = {
            most_recent = true
            before_compute = true
        }
        eks-pod-identity = {
            most_recent = true
            before_compute = true
        }
        aws-ebs-csi-driver = {
            most_recent = true
            service_account_role_arn = module.ebs_csi_irsa.iam_role_arn
        }
        metric-server = {
            most_recent = true
        }
    }

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets
    control_plane_subnet_ids = module.vpc.intra_subnets
    eks_managed_node_groups = {
        node-groups = {
            instance_types = [var.node_instance_type]
            desired_size = var.node_desired_count
            min_size = var.node_desired_count
            max_size = var.max_count
        }
    }
  
}

