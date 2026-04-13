# variables.tf

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "main-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
  default     = 2
}

variable "subnet_newbits" {
  description = "Additional subnet bits used with cidrsubnet"
  type        = number
  default     = 8
}

variable "private_subnet_offset" {
  description = "Offset index for private subnet cidr blocks"
  type        = number
  default     = 2
}

variable "availability_zones" {
  description = "Availability Zones for subnets"
  type        = list(string)
  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

variable "map_public_ip_on_launch" {
  description = "Assign public IP to public subnet instances"
  type        = bool
  default     = true
}

variable "public_route_table_name" {
  description = "Public route table name"
  type        = string
  default     = "public-rt"
}

variable "private_route_table_name" {
  description = "Private route table name"
  type        = string
  default     = "private-rt"
}

variable "internet_gateway_name" {
  description = "Internet Gateway name"
  type        = string
  default     = "main-igw"
}

variable "nat_gateway_name" {
  description = "NAT Gateway name"
  type        = string
  default     = "main-nat"
}

variable "eip_name" {
  description = "Elastic IP name for NAT"
  type        = string
  default     = "nat-eip"
}

variable "default_route_cidr" {
  description = "Default route CIDR block"
  type        = string
  default     = "0.0.0.0/0"
}

variable "nat_subnet_index" {
  description = "Public subnet index where NAT Gateway will be placed"
  type        = number
  default     = 0
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "terraform-app"
  }
}