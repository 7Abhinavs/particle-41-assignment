# Particle-41 Assignment – Terraform AWS Infrastructure

## Overview

This project provisions a complete AWS infrastructure using Terraform to deploy a containerised application on Amazon ECS Fargate behind an Application Load Balancer (ALB).

It demonstrates real-world DevOps practices such as:

* Infrastructure as Code using Terraform
* Modular Terraform structure
* ECS Fargate deployment
* Docker image build and push pipeline
* GitHub Actions CI/CD
* Remote Terraform backend using S3 + DynamoDB

---

# Project Structure

```text
PARTICAL41/
│
├── .github/
│   └── workflows/
│       ├── terraform-deploy.yml
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

# What Terraform Creates

## VPC Module

Creates core networking:

* Custom VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables

## ALB Module

Creates:

* Application Load Balancer
* Listener
* Target Group
* Security Group

## ECS Module

Creates:

* ECS Cluster
* ECS Task Definition
* ECS Service
* Security Group
* IAM Roles
* CloudWatch Logs

## Backend Module

Creates remote Terraform backend:

* S3 Bucket for state file
* DynamoDB table for state locking

---

# How This Architecture Works

```text
User Request
    ↓
Application Load Balancer
    ↓
ECS Fargate Service
    ↓
Docker Container App
```

Networking:

```text
VPC
├── Public Subnet A  -> ALB / NAT
├── Public Subnet B
├── Private Subnet A -> ECS Tasks
└── Private Subnet B -> ECS Tasks
```

---

# Prerequisites

Install:

* Terraform
* AWS CLI
* Git
* Docker (optional for local builds)

Configure AWS credentials:

```bash
aws configure
```

---

# How to Run Terraform Locally

## Step 1: Move to Terraform Folder

```bash
cd terraform
```

## Step 2: Initialize Terraform

```bash
terraform init
```

## Step 3: Validate Code

```bash
terraform validate
```

## Step 4: Review Plan

```bash
terraform plan
```

## Step 5: Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

---

# How to Destroy Infrastructure

```bash
terraform destroy
```

---

# Variables

Infrastructure values are controlled through:

```text
terraform.tfvars
```

Example:

```hcl
region = "ap-south-1"
desired_count = 1
container_image = "yourrepo/app:latest"
```

---

# Outputs

After apply:

```bash
terraform output
```

Typical outputs:

* alb_dns_name
* application_url
* vpc_id
* ecs_cluster_name
* target_group_arn

---

# CI/CD Pipeline

GitHub Actions pipeline runs on push to `main`.

## Pipeline Steps

1. Checkout source code
2. Build Docker image from `app/Dockerfile`
3. Push image to Docker Hub
4. Run Terraform init / plan / apply
5. Deploy updated application to ECS

---

# Required GitHub Secrets

Add in repository settings:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
```

---

# Remote Backend

Terraform state can be stored remotely using:

* AWS S3 bucket
* DynamoDB lock table

Benefits:

* Shared team state
* Prevents simultaneous updates
* Secure storage
* Better CI/CD support

---

# Useful Terraform Commands

## Format Code

```bash
terraform fmt
```

## Show Resources in State

```bash
terraform state list
```

## Refresh State

```bash
terraform refresh
```

## Show Outputs

```bash
terraform output
```

---

# Best Practices Used

* Modular Terraform design
* Reusable variables
* CI/CD automation
* Containerized deployment
* Separate backend state management

---

# Recommended Future Enhancements

* HTTPS with ACM Certificate
* Route53 custom domain
* ECS Auto Scaling
* Multi-environment setup (dev/prod)
* Monitoring with CloudWatch / Datadog
* Secrets Manager integration

---

# Cleanup

Do not commit:

```text
.terraform/
*.tfstate
*.tfstate.*
terraform.tfvars
```

Use `.gitignore`.

---

# Summary

This project demonstrates end-to-end DevOps implementation using:

* Terraform
* AWS
* ECS Fargate
* Docker
* GitHub Actions
* Infrastructure as Code

---



# GitHub Actions Workflows

This repository includes **three separate GitHub Actions workflows** for Terraform operations.

These workflows are configured with **manual triggers (`workflow_dispatch`)**, which means:

✅ They run **only when started manually from the GitHub Actions UI**
❌ They do **not** run automatically on `git push` or commits

## Available Workflows

### 1. Terraform Deployment

Used to provision or update infrastructure.

Runs:

```bash id="w8ns28"
terraform init
terraform plan
terraform apply
```

---

### 2. Terraform Destroy

Used to remove all deployed AWS infrastructure.

Runs:

```bash id="hqm5bz"
terraform destroy
```

---

### 3. Terraform Remote Backend Setup

Used one time to create backend resources such as:

* S3 bucket for Terraform state
* DynamoDB table for state locking

Runs:

```bash id="i5bms4"
terraform init
terraform apply
```

---

## How to Run Workflows

1. Open the repository in GitHub
2. Go to **Actions** tab
3. Select required workflow
4. Click **Run workflow**

---

## Why Manual Trigger is Used

Manual execution gives better control for infrastructure changes such as:

* Prevent accidental deployments
* Avoid unintended destroy operations
* Controlled backend setup
* Safer production workflow management

---:::

