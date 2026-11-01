
# ==========================================
# VPC OUTPUTS
# ==========================================

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

# ==========================================
# AVAILABILITY ZONES
# ==========================================

output "availability_zones" {
  value = [
    var.az_1,
    var.az_2,
    var.az_3
  ]
}

# ==========================================
# PUBLIC SUBNET IDS
# ==========================================

output "public_subnet_1_id" {
  value = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}

output "public_subnet_3_id" {
  value = aws_subnet.public_3.id
}

# ==========================================
# PRIVATE SUBNET IDS
# ==========================================

output "private_subnet_1_id" {
  value = aws_subnet.private_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_2.id
}

output "private_subnet_3_id" {
  value = aws_subnet.private_3.id
}

# ==========================================
# INTERNET GATEWAY
# ==========================================

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

# ==========================================
# NAT GATEWAY
# ==========================================

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}

# ==========================================
# ELASTIC IP
# ==========================================

output "elastic_ip" {
  value = aws_eip.nat.public_ip
}

output "elastic_ip_allocation_id" {
  value = aws_eip.nat.id
}

# ==========================================
# ROUTE TABLES
# ==========================================

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}

# ==========================================
# ROUTES
# ==========================================

output "public_route_id" {
  value = aws_route.public_internet.id
}

output "private_route_id" {
  value = aws_route.private_internet.id
}

# ==========================================
# ROUTE TABLE ASSOCIATIONS
# ==========================================

output "public_association_1_id" {
  value = aws_route_table_association.public_1.id
}

output "public_association_2_id" {
  value = aws_route_table_association.public_2.id
}

output "public_association_3_id" {
  value = aws_route_table_association.public_3.id
}

output "private_association_1_id" {
  value = aws_route_table_association.private_1.id
}

output "private_association_2_id" {
  value = aws_route_table_association.private_2.id
}

output "private_association_3_id" {
  value = aws_route_table_association.private_3.id
}

# ==========================================
# END OF OUTPUTS.TF
# ==========================================
