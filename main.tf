module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.1"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  attributes = "${var.attributes}"
  delimiter  = "${var.delimiter}"
  tags       = "${var.tags}"
  enabled    = "${var.enabled}"
}

module "chamber_user" {
  count     = "${var.enabled == "true" ? 1 : 0}"
	source    = "git::https://github.com/cloudposse/terraform-aws-iam-system-user.git?ref=master"
	namespace = "${var.namespace}"
	stage     = "${var.stage}"
	name      = "${module.label.id}"
	policy    = "${var.policy}"
}