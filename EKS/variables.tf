variable "region" {
  description = "This will store region value"
  type        = string
  default     = "us-east-2"
}

variable "vpc_name" {
  description = "This will store vpc_name"
  type        = string
  default     = "vpc-practice"
}

variable "cluster_name" {
  description = "This will store vpc_name"
  type        = string
  default     = "EKS-cluster-terraform"
}

variable "cluster_version" {
  description = "This will store vpc_name"
  type        = string
  default     = "1.34"

}

variable "node_instance_type" {
  description = "This will store node instance type"
  type        = string
  default     = "t3.medium"

}

variable "node_desired_count" {
  description = "This will store node desired count"
  type        = number
  default     = 3

}

variable "max_count" {
  description = "This will store node max count"
  type        = number
  default     = 5

}