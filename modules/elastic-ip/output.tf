output "elastic_ip_id" {

  value = aws_eip.eip.id

}

output "elastic_ip_public_ip" {

  value = aws_eip.eip.public_ip

}