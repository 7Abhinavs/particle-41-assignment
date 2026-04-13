# root variables.tf

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "Partical41"
    Owner       = "DevOps"
  }
}

# ---------------------------------
# VPC Variables
# ---------------------------------

variable "vpc_name" {
  type    = string
  default = "main-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_count" {
  type    = number
  default = 2
}

variable "private_subnet_count" {
  type    = number
  default = 2
}

variable "subnet_newbits" {
  type    = number
  default = 8
}

variable "private_subnet_offset" {
  type    = number
  default = 2
}

variable "availability_zones" {
  type = list(string)
  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

variable "internet_gateway_name" {
  type    = string
  default = "main-igw"
}

variable "public_route_table_name" {
  type    = string
  default = "public-rt"
}

variable "private_route_table_name" {
  type    = string
  default = "private-rt"
}

variable "nat_gateway_name" {
  type    = string
  default = "main-nat"
}

variable "eip_name" {
  type    = string
  default = "nat-eip"
}

variable "nat_subnet_index" {
  type    = number
  default = 0
}

variable "default_route_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

# ---------------------------------
# ALB Variables
# ---------------------------------

variable "alb_name" {
  type    = string
  default = "main-alb"
}

variable "alb_sg_name" {
  type    = string
  default = "alb-sg"
}

variable "listener_port" {
  type    = number
  default = 80
}

variable "listener_protocol" {
  type    = string
  default = "HTTP"
}

variable "target_group_name" {
  type    = string
  default = "main-tg"
}

variable "target_group_port" {
  type    = number
  default = 80
}

variable "target_group_protocol" {
  type    = string
  default = "HTTP"
}

variable "target_type" {
  type    = string
  default = "ip"
}

variable "ingress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

# ---------------------------------
# ECS Variables
# ---------------------------------

variable "ecs_cluster_name" {
  type    = string
  default = "simple-cluster"
}

variable "ecs_service_name" {
  type    = string
  default = "simple-service"
}

variable "task_family" {
  type    = string
  default = "simple-task"
}

variable "launch_type" {
  type    = string
  default = "FARGATE"
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "network_mode" {
  type    = string
  default = "awsvpc"
}

variable "requires_compatibilities" {
  type    = list(string)
  default = ["FARGATE"]
}

variable "cpu" {
  type    = string
  default = "256"
}

variable "memory" {
  type    = string
  default = "512"
}

variable "container_name" {
  type    = string
  default = "app"
}

variable "container_image" {
  type    = string
  default = "7souls/partical41:latest"
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "assign_public_ip" {
  type    = bool
  default = false
}

variable "execution_role_name" {
  type    = string
  default = "ecsTaskExecutionRole"
}

variable "task_role_name" {
  type    = string
  default = "ecsTaskRole"
}

variable "ecs_security_group_name" {
  type    = string
  default = "ecs-sg"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "log_group_name" {
  type    = string
  default = "/ecs/app"
}

variable "log_retention_days" {
  type    = number
  default = 7
}

variable "log_stream_prefix" {
  type    = string
  default = "ecs"
}