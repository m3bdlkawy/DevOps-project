output "key_name" {
  value = aws_key_pair.k8s_key_pair.key_name
}

output "private_key_path" {
  value = local_file.private_key.filename
}
