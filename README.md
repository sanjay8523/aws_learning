# AWS Networking with Terraform

## Project Overview

A hands-on AWS networking project built using Terraform.

The objective was to understand how AWS VPC networking works by provisioning the infrastructure using Infrastructure as Code.

## Architecture

- 1 VPC (`10.0.0.0/16`)
- 3 public subnets across 3 Availability Zones
- 3 private subnets across 3 Availability Zones
- 1 Internet Gateway
- 1 NAT Gateway
- 1 Elastic IP
- 2 custom route tables
- Public and private subnet route table associations

## AWS Region

Asia Pacific (Mumbai) — `ap-south-1`

## Terraform Files

- `main.tf` — AWS provider and infrastructure resources
- `variables.tf` — configurable variables
- `outputs.tf` — infrastructure IDs and outputs

## Concepts Learned

- VPC and CIDR addressing
- Public and private subnets
- Availability Zones
- Internet Gateway
- NAT Gateway and Elastic IP
- Route tables and subnet associations
- Terraform init, validate, plan, apply and destroy

## Deployment and Cleanup

The infrastructure was successfully provisioned and verified.

All 20 Terraform-managed resources were subsequently destroyed to avoid ongoing infrastructure charges.

## Cost Awareness

A NAT Gateway and public IPv4 address can incur charges while allocated. This project was intentionally destroyed after the learning exercise.

**Note:** No EC2 instances or other compute resources were deployed.
