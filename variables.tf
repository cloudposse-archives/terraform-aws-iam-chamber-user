variable "namespace" {
  type        = string
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = string
  description = "Application or solution name (e.g. `app`)"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "kms_key_arn" {
  description = "ARN of the KMS key which will decrypt secret strings"
}

variable "ssm_actions" {
  type        = list
  default     = ["ssm:GetParametersByPath", "ssm:GetParameters"]
  description = "Actions to allow in the policy"
}

variable "ssm_resources" {
  type        = list
  default     = ["*"]
  description = "Resources to apply the actions specified in the policy"
}

variable "force_destroy" {
  default     = "false"
  description = "Destroy even if it has non-Terraform-managed IAM access keys, login profiles or MFA devices"
}

variable "path" {
  type        = string
  default     = "/"
  description = "Path in which to create the user"
}

variable "enabled" {
  default     = "true"
  description = "Set to false to prevent the module from creating any resources"
}
