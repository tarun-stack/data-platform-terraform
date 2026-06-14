# General

project_name = "data-platform"
environment = "dev"
aws_region = "ap-south-1"

# Networking
vpc_cidr = "10.0.0.0/16"
availability_zones = [ "ap-south-1a","ap-south-1b","ap-south-1c" ]
public_subnet_cidrs = [ "10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
private_subnet_cidrs = [ "10.0.11.0/24","10.0.12.0/24","10.0.13.0/24" ]
enable_nat_gateway = true
single_nat_gateway = true
enable_flow_logs = true

# EKS
admin_iam_arn   = "arn:aws:iam::000000000000:user/terraform-admin"
cluster_version = "1.32"
node_groups = {
  primary = {
    instance_type = "t3.small"
    desired_size = 1
    min_size = 1
    max_size = 3
  }
  secondary = {
    instance_type = "t3.medium"
    desired_size = 1
    min_size = 1
    max_size = 2
  }
}

# Airflow
airflow_version = "3.0.6"
environment_class = "mw1.small"
min_workers = 1
max_workers = 3

# Monitoring
alarm_email = "sarangtagad@gmail.com"
cpu_alarm_threshold = 90
memory_alarm_threshold = 90

# Tags
tags = {
    Owner = "Sarang Tagad"
    Team = "data-platform"
    CostCenter = "data-engineering"
}
