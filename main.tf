
# ==========================================
# TERRAFORM AND AWS PROVIDER
# ==========================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# ==========================================
# VPC
# ==========================================

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "learning-vpc"
  }
}

# ==========================================
# INTERNET GATEWAY
# ==========================================

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "learning-igw"
  }
}

# ==========================================
# PUBLIC SUBNET 1
# ==========================================

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_1_cidr
  availability_zone       = var.az_1
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

# PUBLIC SUBNET 2

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_2_cidr
  availability_zone       = var.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

# PUBLIC SUBNET 3

resource "aws_subnet" "public_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_3_cidr
  availability_zone       = var.az_3
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-3"
  }
}

# ==========================================
# PRIVATE SUBNET 1
# ==========================================

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_1_cidr
  availability_zone = var.az_1

  tags = {
    Name = "private-subnet-1"
  }
}

# PRIVATE SUBNET 2

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_2_cidr
  availability_zone = var.az_2

  tags = {
    Name = "private-subnet-2"
  }
}

# PRIVATE SUBNET 3

resource "aws_subnet" "private_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_3_cidr
  availability_zone = var.az_3

  tags = {
    Name = "private-subnet-3"
  }
}

# ==========================================
# PUBLIC ROUTE TABLE
# ==========================================

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-route-table"
  }
}

# PUBLIC ROUTE TO INTERNET GATEWAY

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

# PUBLIC SUBNET ASSOCIATIONS

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_3" {
  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.public.id
}

# ==========================================
# ELASTIC IP
# ==========================================

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "nat-elastic-ip"
  }
}

# ==========================================
# NAT GATEWAY
# ==========================================

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "learning-nat-gateway"
  }

  depends_on = [
    aws_internet_gateway.main
  ]
}

# ==========================================
# PRIVATE ROUTE TABLE
# ==========================================

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-route-table"
  }
}

# PRIVATE ROUTE TO NAT GATEWAY

resource "aws_route" "private_internet" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

# PRIVATE SUBNET ASSOCIATIONS

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_3" {
  subnet_id      = aws_subnet.private_3.id
  route_table_id = aws_route_table.private.id
}

# ==========================================
# END OF MAIN.TF
# ==========================================
# Creates one VPC, six subnets, one IGW,
# one NAT Gateway, one EIP, two route tables,
# two routes and six subnet associations.
# No EC2 instances or compute resources.
