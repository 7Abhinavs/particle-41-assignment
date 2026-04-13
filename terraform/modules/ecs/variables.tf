# variables.tf

variable "vpc_id" {
  description = "VPC ID for ECS resources"
  type        = string
  default     = ""
}

variable "private_subnets" {
  description = "Private subnet IDs for ECS service"
  type        = list(string)
  default     = []
}

variable "target_group_arn" {
  description = "ALB Target Group ARN"
  type        = string
  default     = ""
}

variable "ecs_cluster_name" {
  description = "ECS Cluster Name"
  type        = string
  default     = "simple-cluster"
}

variable "ecs_service_name" {
  description = "ECS Service Name"
  type        = string
  default     = "simple-service"
}

variable "task_family" {
  description = "Task Definition Family"
  type        = string
  default     = "simple-task"
}

variable "launch_type" {
  description = "ECS Launch Type"
  type        = string
  default     = "FARGATE"
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 1
}

variable "network_mode" {
  description = "Task networking mode"
  type        = string
  default     = "awsvpc"
}

variable "requires_compatibilities" {
  description = "Task compatibility mode"
  type        = list(string)
  default     = ["FARGATE"]
}

variable "cpu" {
  description = "CPU units for task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory for task"
  type        = string
  default     = "512"
}

variable "container_name" {
  description = "Container name"
  type        = string
  default     = "app"
}

variable "container_image" {
  description = "Docker image"
  type        = string
  default     = "7souls/partical41:latest"
}

variable "container_port" {
  description = "Application container port"
  type        = number
  default     = 3000
}

variable "assign_public_ip" {
  description = "Assign public IP to ECS tasks"
  type        = bool
  default     = false
}

variable "execution_role_name" {
  description = "Existing ECS execution role name"
  type        = string
  default     = "ecsTaskExecutionRole"
}

variable "task_role_name" {
  description = "ECS task role name"
  type        = string
  default     = "ecsTaskRole"
}

variable "ecs_security_group_name" {
  description = "Security group name for ECS"
  type        = string
  default     = "ecs-sg"
}

variable "ingress_cidr_blocks" {
  description = "Allowed ingress CIDRs"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "Allowed egress CIDRs"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "aws_region" {
  description = "AWS region for logs"
  type        = string
  default     = "ap-south-1"
}

variable "log_group_name" {
  description = "CloudWatch log group name"
  type        = string
  default     = "/ecs/app"
}

variable "log_retention_days" {
  description = "CloudWatch log retention"
  type        = number
  default     = 7
}

variable "log_stream_prefix" {
  description = "CloudWatch log stream prefix"
  type        = string
  default     = "ecs"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "terraform-app"
  }
}