output "domain_name" {
  description = ""
  value       = "${aws_elasticsearch_domain.this.domain_name}"
}

output "endpoint" {
  description = ""
  value       = "${aws_elasticsearch_domain.this.endpoint}"
}

output "kibana_endpoint" {
  description = ""
  value       = "${aws_elasticsearch_domain.this.kibana_endpoint}"
}
