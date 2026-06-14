# =============================================================================
# General
# =============================================================================
variable "project_name" {
  description = "Name of the project"
  type        = string
}
variable "admin_iam_arn" {
  type    = string
  default = null   # if null, we'll look it up
}
variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev"], var.environment)
    error_message = "Environment should be dev only"
  }
}

variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "tags" {
  description = "Additional key-value pair tags to be applied to all resources"
  type        = map(string)
  default     = {}
}

# =============================================================================
# Networking
# =============================================================================
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones to deploy resources into"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to enable NAT gateway for private subnets"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether to use a single NAT gateway across all AZs"
  type        = bool
  default     = true
}

variable "enable_flow_logs" {
  description = "Whether to enable VPC flow logs"
  type        = bool
  default     = true
}

# =============================================================================
# EKS
# =============================================================================
variable "admin_iam_arn" {
  description = "ARN of the IAM user or role that needs kubectl admin access to the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.29"
}

variable "node_groups" {
  description = "Map of EKS node group configurations"
  type = map(object({
    instance_type = string
    desired_size  = number
    min_size      = number
    max_size      = number
  }))
}

# =============================================================================
# Airflow
# =============================================================================
variable "airflow_version" {
  description = "Version of Apache Airflow to use"
  type        = string
  default     = "3.0.6"
}

variable "environment_class" {
  description = "MWAA environment class (mw1.small, mw1.medium, mw1.large)"
  type        = string
  default     = "mw1.small"
}

variable "min_workers" {
  description = "Minimum number of MWAA workers"
  type        = number
  default     = 1
}

variable "max_workers" {
  description = "Maximum number of MWAA workers"
  type        = number
  default     = 3
}

# =============================================================================
# Monitoring
# =============================================================================
variable "alarm_email" {
  description = "Email address to receive CloudWatch alarm notifications"
  type        = string
}

variable "cpu_alarm_threshold" {
  description = "CPU utilization percentage threshold to trigger alarm"
  type        = number
  default     = 90 # dev uses higher threshold — not customer-facing
}

variable "memory_alarm_threshold" {
  description = "Memory utilization percentage threshold to trigger alarm"
  type        = number
  default     = 90 # dev uses higher threshold — not customer-facing
}


