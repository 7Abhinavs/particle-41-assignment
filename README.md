# Particle-41 Assignment – AWS Infrastructure Deployment using Terraform

## Project Overview

This project demonstrates a complete DevOps deployment pipeline using Terraform to provision AWS infrastructure and deploy a containerized application on Amazon ECS Fargate behind an Application Load Balancer (ALB).

It follows modern Infrastructure as Code and CI/CD practices using:

* Terraform
* AWS
* Docker
* GitHub Actions
* Remote Terraform Backend (S3 + DynamoDB)

---

# What This Project Creates

Terraform provisions the following AWS resources:

## Networking

* Custom VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Public Route Tables
* Private Route Tables

## Load Balancing

* Application Load Balancer
* Listener
* Target Group
* Security Group

## Compute

* ECS Cluster
* ECS Task Definition
* ECS Service (Fargate)
* CloudWatch Log Group
* IAM Roles
* ECS Security Group

## Remote State Backend

* Amazon S3 bucket for Terraform state
* Amazon DynamoDB table for state locking

---

# Architecture Flow

```text id="8azvgc"
User Request
    ↓
Application Load Balancer
    ↓
ECS Fargate Service
    ↓
Docker Containerized App
```

Network Layout:

```text id="a1v8cw"
VPC
├── Public Subnet A  -> ALB / NAT Gateway
├── Public Subnet B
├── Private Subnet A -> ECS Tasks
└── Private Subnet B -> ECS Tasks
```

---

# Repository Structure

```text id="2dn3go"
PARTICAL41/
│
├── .github/
│   └── workflows/
│       ├── terraform-deploy.yml
│       ├── terraform-destroy.yml
│       └── backend-bootstrap.yml
│
├── app/
│   ├── Dockerfile
│   └── Application source code
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   │
│   └── modules/
│       ├── vpc/
│       ├── alb/
│       ├── ecs/
│       └── terraform-backend/
```

---

# Folder Purpose

## app/

Contains application source code and Dockerfile.

Used by CI/CD pipeline to:

* Build Docker image
* Push image to Docker Hub

## terraform/

Main Infrastructure as Code folder.

Contains:

* Root Terraform configuration
* Variables
* Outputs
* Module references

## terraform/modules/

Reusable Terraform modules:

* vpc
* alb
* ecs
* terraform-backend

## .github/workflows/

GitHub Actions workflows for deployment automation.

---

# Terraform Modules

## VPC Module

Creates:

* VPC
* Public & Private Subnets
* NAT Gateway
* Internet Gateway
* Route Tables

## ALB Module

Creates:

* Application Load Balancer
* Target Group
* Listener
* Security Group

## ECS Module

Creates:

* ECS Cluster
* ECS Task Definition
* ECS Service

Deploys the Docker application.

## Terraform Backend Module

Creates:

* S3 Bucket
* DynamoDB Lock Table

Used for remote Terraform state.

---

# GitHub Actions Workflows

This repository contains **3 manual workflows**.

They run **only when started manually from GitHub UI** using `workflow_dispatch`.

They do **not** run automatically on git push.

## 1. Terraform Deployment

Used to provision or update infrastructure.

Runs:

```bash id="r9zcq6"
terraform init
terraform plan
terraform apply
```

## 2. Terraform Destroy

Used to remove deployed AWS resources.

Runs:

```bash id="6xv1te"
terraform destroy
```

## 3. Terraform Backend Setup

Used one time to create:

* S3 backend bucket
* DynamoDB locking table

Runs:

```bash id="d3l4yg"
terraform init
terraform apply
```

---

# How to Run Workflows

1. Open repository in GitHub
2. Go to **Actions**
3. Select required workflow
4. Click **Run workflow**

---

# Recommended Order of Execution

For first-time setup:

1. Run **Terraform Backend Setup**
2. Run **Terraform Deployment**
3. Use **Terraform Destroy** when cleanup is required

---

# Local Terraform Usage

## Step 1

```bash id="8ajd95"
cd terraform
```

## Step 2

```bash id="h1s4wv"
terraform init
```

## Step 3

```bash id="x79z1j"
terraform validate
```

## Step 4

```bash id="bh3u7m"
terraform plan
```

## Step 5

```bash id="u7w9p3"
terraform apply
```

---

# Destroy Infrastructure

```bash id="93s0qv"
terraform destroy
```

---

# Variables

Infrastructure values are managed using:

```text id="9l1y7r"
terraform.tfvars
```

Examples:

```hcl id="8unv8v"
region = "ap-south-1"
desired_count = 1
container_image = "yourdockerhub/app:latest"
```

---

# Outputs

After deployment:

```bash id="4t6l0x"
terraform output
```

Typical outputs:

* alb_dns_name
* application_url
* vpc_id
* ecs_cluster_name
* target_group_arn

---

# Required GitHub Secrets

Configure repository secrets:

```text id="shtr67"
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
```

---

# Remote Backend Benefits

Terraform state is stored remotely using:

* Amazon S3
* Amazon DynamoDB

Benefits:

* Shared team state
* Safe locking
* Better CI/CD support
* State versioning

---

# Useful Terraform Commands

## Format Code

```bash id="0pw9ea"
terraform fmt
```

## Show State Resources

```bash id="s7mx0e"
terraform state list
```

## Show Outputs

```bash id="g8ec69"
terraform output
```

---

# Security Best Practices

* Do not commit secrets
* Use GitHub Secrets
* Use private subnets for workloads
* Restrict security groups
* Use HTTPS in production
* Use IAM least privilege access

---

# Production Hardening Recommendations

## Security

* Enable HTTPS using AWS Certificate Manager
* Redirect HTTP to HTTPS
* Use AWS Secrets Manager
* Enable encryption for logs and state bucket
* Add AWS WAF

## Availability

* ECS Auto Scaling
* Multi-AZ deployment
* Multiple NAT Gateways
* Rolling deployments

## Monitoring

* Amazon CloudWatch alarms
* ALB access logs
* Application health checks
* Optional Datadog integration

## CI/CD Improvements

* Manual approvals for production
* Docker image version tags
* Security image scanning
* Rollback strategy

## Cost Optimization

* Right-size ECS resources
* Stop non-prod when unused
* Review NAT Gateway cost

---

# Important Files to Ignore

Use `.gitignore`

```text id="f4vvba"
.terraform/
*.tfstate
*.tfstate.*
terraform.tfvars
```

---

# Why This Project Matters

This project demonstrates practical DevOps capabilities:

* Terraform modular architecture
* AWS infrastructure automation
* ECS container deployment
* CI/CD pipelines
* Remote state management
* Production-ready deployment concepts

---

# Author
Abhinav Chauhan
