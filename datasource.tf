data "aws_iam_policy_document" "this" {
  statement {
    sid = "Access to ${var.env_name} ES Domain"
    effect = "Allow"

    actions = [
      "es:*",
    ]

    principals {
      identifiers = ["775645521685"]
      type = "AWS"
    }

    resources = ["${aws_elasticsearch_domain.this.arn}"]
  }
}

data "aws_vpc" "selected" {
  tags {
    Env    = "${var.env_name}"
    Tenant = "${var.tenant}"
  }
}
