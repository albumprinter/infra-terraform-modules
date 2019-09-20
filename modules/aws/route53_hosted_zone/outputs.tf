output "route53_zone" {
  value = aws_route53_zone.zone
}

output "route53_records" {
  value = aws_route53_record.record
}
