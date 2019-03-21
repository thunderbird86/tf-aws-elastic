# Required
variable "env_name" {}
variable "tenant" {}
variable "vpc_id" {
}
variable "subnet_ids" {
  type = "list"
}

# Optional
variable "name" {
  default = "elasticsearch"
}

variable "elasticsearch_version" {
  default = "6.4"
}
variable "instance_type" {
  default = "m4.large.elasticsearch"
}

variable "automated_snapshot_start_hour" {
  default = 4
}

variable "tags" {
  description = ""
  type = "map"
  default = {}
}

variable "instance_count" {
  default = 2
}

variable "dedicated_master_enabled" {
  default = false
}

variable "dedicated_master_count" {
  default = 1
}

variable "zone_awareness_enabled" {
  default = false
}

variable "node_to_node_encryption" {
  default = false
}

variable "log_publishing_options" {
  default = false
}

variable "cloudwatch_log_group_arn" {
  default = ""
}

variable "log_type" {
  default = "INDEX_SLOW_LOGS"
}

variable "kms_key_id" {
  default = ""
}

variable "volume_type" {
  default = "gp2"
}

variable "volume_size" {
  default = "100"
}

variable "ebs_options" {
  default = true
}

variable "security_group_ids" {
  type = "list"
  default = []
}
