output "ssh_key_name" {
  value = aws_key_pair.key_pair.key_name
}

output "ssh_key_path" {
  value = local_file.my_key_file.filename
}