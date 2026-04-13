# variables.tf

variable "vpc_id" {
  description = "VPC ID where ALB will be created"
  type        = string
  default     = ""
}

variable "subnets" {
  description = "Public subnet IDs for ALB"
  type        = list(string)
  default     = []
}

variable "alb_name" {
  description = "Application Load Balancer name"
  type        = string
  default     = "main-alb"
}

variable "alb_sg_name" {
  description = "Security Group name for ALB"
  type        = string
  default     = "alb-sg"
}

variable "listener_port" {
  description = "ALB Listener Port"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "ALB Listener Protocol"
  type        = string
  default     = "HTTP"
}

variable "target_group_name" {
  description = "Target Group Name"
  type        = string
  default     = "main-tg"
}

variable "target_group_port" {
  description = "Target Group Port"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Target Group Protocol"
  type        = string
  default     = "HTTP"
}

variable "target_type" {
  description = "Target type for Target Group"
  type        = string
  default     = "ip"
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks allowed to access ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks allowed for outbound traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "terraform-app"
  }
}