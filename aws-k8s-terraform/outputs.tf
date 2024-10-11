output "master_public_ip" {
  value = module.ec2.master_public_ip
}

output "worker1_public_ip" {
  value = module.ec2.worker1_public_ip
}

output "worker2_public_ip" {
  value = module.ec2.worker2_public_ip
}
