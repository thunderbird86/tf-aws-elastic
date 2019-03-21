resource "aws_security_group" "this" {
  name_prefix = "${var.env_name}-${var.name}-"
  vpc_id      = "${var.vpc_id}"

  lifecycle {
    create_before_destroy = true
  }

  tags = "${merge(var.tags, local.tags)}"
}

resource "aws_security_group_rule" "this_ingress" {
  security_group_id = "${aws_security_group.this.id}"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "this_egress" {
  security_group_id = "${aws_security_group.this.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
