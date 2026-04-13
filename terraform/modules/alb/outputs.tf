output "target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.tg.arn
}

output "alb_dns" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.alb.arn
}

output "alb_security_group_id" {
  description = "Security group ID attached to ALB"
  value       = aws_security_group.alb_sg.id
}

output "listener_arn" {
  description = "ARN of ALB listener"
  value       = aws_lb_listener.listener.arn
}