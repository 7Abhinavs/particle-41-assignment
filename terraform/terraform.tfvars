region = "ap-south-1"

tags = {
  Environment = "dev"
  Project     = "Partical41"
  Owner       = "DevOps"
}

# -----------------------------
# VPC
# -----------------------------

vpc_name = "particle41-vpc"
vpc_cidr = "10.0.0.0/16"

public_subnet_count  = 2
private_subnet_count = 2

subnet_newbits        = 8
private_subnet_offset = 2

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

map_public_ip_on_launch = true

internet_gateway_name    = "main-igw"
public_route_table_name  = "public-rt"
private_route_table_name = "private-rt"

nat_gateway_name = "main-nat"
eip_name         = "nat-eip"

nat_subnet_index = 0

default_route_cidr = "0.0.0.0/0"

# -----------------------------
# ALB
# -----------------------------

alb_name = "main-alb"

alb_sg_name = "alb-sg"

listener_port     = 80
listener_protocol = "HTTP"

target_group_name     = "main-tg"
target_group_port     = 80
target_group_protocol = "HTTP"
target_type           = "ip"

ingress_cidr_blocks = [
  "0.0.0.0/0"
]

egress_cidr_blocks = [
  "0.0.0.0/0"
]

# -----------------------------
# ECS
# -----------------------------

ecs_cluster_name = "simple-cluster"
ecs_service_name = "simple-service"

task_family   = "simple-task"
launch_type   = "FARGATE"
desired_count = 1

network_mode = "awsvpc"

requires_compatibilities = [
  "FARGATE"
]

cpu    = "256"
memory = "512"

container_name  = "app"
container_image = "7souls/partical41:latest"
container_port  = 3000

assign_public_ip = false

execution_role_name     = "ecsTaskExecutionRole"
task_role_name          = "ecsTaskRole"
ecs_security_group_name = "ecs-sg"

aws_region = "ap-south-1"

log_group_name     = "/ecs/app"
log_retention_days = 7
log_stream_prefix  = "ecs"