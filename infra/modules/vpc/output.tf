
output "vpc_id" {
  value = aws_vpc.main.id
   description = "VPC ID id"
}


output "private_subnet_ids" {
  value = aws_subnet.private[*].id
  description = "private subnets id"
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
  description = "public subnets id"
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
  description = "Internet gateway id"
}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
  description = "Nat gateway id"
}

