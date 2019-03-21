locals {
  tags = {
    Env     = "${var.env_name}"
    Tenant  = "${var.tenant}"
    Service = "${var.name}"
  }
}
