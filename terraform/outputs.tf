# outputs.tf (root / main folder)

# -----------------------------
# VPC Outputs
# -----------------------------

output "vpc_id" {
  description = "VPC ID created by VPC module"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

# -----------------------------
# ALB Outputs
# -----------------------------

output "alb_dns_name" {
  description = "DNS name of Application Load Balancer"
  value       = module.alb.alb_dns
}

output "target_group_arn" {
  description = "ARN of ALB Target Group"
  value       = module.alb.target_group_arn
}