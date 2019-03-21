resource "aws_iam_service_linked_role" "this" {
  aws_service_name = "es.amazonaws.com"
}

resource "aws_elasticsearch_domain" "this" {
  domain_name           = "${var.env_name}"
  elasticsearch_version = "${var.elasticsearch_version}"

  vpc_options {
    subnet_ids         = ["${var.subnet_ids}"]
    security_group_ids = ["${var.security_group_ids}", "${aws_security_group.this.id}"]
  }

  cluster_config {
    instance_type            = "${var.instance_type}"
    instance_count           = "${var.instance_count}"
    dedicated_master_enabled = "${var.dedicated_master_enabled}"
    dedicated_master_count   = "${var.dedicated_master_count}"
    zone_awareness_enabled   = "${var.zone_awareness_enabled}"
  }

  ebs_options {
    ebs_enabled = "${var.ebs_options}"
    volume_type = "${var.volume_type}"
    volume_size = "${var.volume_size}"
  }

  encrypt_at_rest {
    enabled    = false
    kms_key_id = "${var.kms_key_id}"
  }

  node_to_node_encryption {
    enabled = "${var.node_to_node_encryption}"
  }

  snapshot_options {
    automated_snapshot_start_hour = "${var.automated_snapshot_start_hour}"
  }

  log_publishing_options {
    enabled                  = "${var.log_publishing_options}"
    cloudwatch_log_group_arn = "${var.cloudwatch_log_group_arn}"
    log_type                 = "${var.log_type}"
  }

  tags = "${merge(var.tags, local.tags, map("Name", format("%s", "env_name")))}"

  depends_on = [
    "aws_iam_service_linked_role.this",
  ]
}

resource "aws_elasticsearch_domain_policy" "this" {
  access_policies = "${data.aws_iam_policy_document.this.json}"
  domain_name     = "${aws_elasticsearch_domain.this.domain_name}"
}
