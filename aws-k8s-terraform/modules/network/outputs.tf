output "vpc_id" {
  value = aws_vpc.k8s_vpc.id
}

output "subnet_id" {
  value = aws_subnet.k8s_subnet.id
}

output "security_group_id" {
  value = aws_security_group.k8s_sg.id
}
