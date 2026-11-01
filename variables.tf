
# ==========================================
# AWS REGION
# ==========================================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

# ==========================================
# AVAILABILITY ZONES
# ==========================================

variable "az_1" {
  description = "First Availability Zone"
  type        = string
  default     = "ap-south-1a"
}

variable "az_2" {
  description = "Second Availability Zone"
  type        = string
  default     = "ap-south-1b"
}

variable "az_3" {
  description = "Third Availability Zone"
  type        = string
  default     = "ap-south-1c"
}

# ==========================================
# VPC CIDR
# ==========================================

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

# ==========================================
# PUBLIC SUBNET CIDRs
# ==========================================

variable "public_1_cidr" {
  type        = string
  description = "CIDR for public subnet 1"
  default     = "10.0.1.0/24"
}

variable "public_2_cidr" {
  type        = string
  description = "CIDR for public subnet 2"
  default     = "10.0.2.0/24"
}

variable "public_3_cidr" {
  type        = string
  description = "CIDR for public subnet 3"
  default     = "10.0.3.0/24"
}

# ==========================================
# PRIVATE SUBNET CIDRs
# ==========================================

variable "private_1_cidr" {
  type        = string
  description = "CIDR for private subnet 1"
  default     = "10.0.11.0/24"
}

variable "private_2_cidr" {
  type        = string
  description = "CIDR for private subnet 2"
  default     = "10.0.12.0/24"
}

variable "private_3_cidr" {
  type        = string
  description = "CIDR for private subnet 3"
  default     = "10.0.13.0/24"
}

# ==========================================
# END OF VARIABLES.TF
# ==========================================
