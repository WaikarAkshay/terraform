locals {
  region         = var.region
  vpc_name       = var.vpc_name
  cluster_name   = var.cluster_name
  vpc_cidr       = "10.0.0.0/16"
  azs            = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnet  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  intra_subnet   = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]

}