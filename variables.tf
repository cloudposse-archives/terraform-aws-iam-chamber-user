variable "name" {}

variable "kms_key_arn" {}

variable "namespace" {
  default = ""
}

variable "stage" {
  default = ""
}

variable "attributes" {
  type    = "list"
  default = []
}

variable "ssm_actions" {
  type    = "list"
  default = ["ssm:DescribeParameters", "ssm:GetParameters"]
}

variable "ssm_resources" {
  type    = "list"
  default = ["*"]
}

variable "tags" {
  type    = "map"
  default = {}
}

variable "delimiter" {
  default = "-"
}

variable "force_destroy" {
  description = "Destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices."
  default     = "false"
}

variable "path" {
  description = "Path in which to create the user"
  default     = "/"
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = "true"
}
