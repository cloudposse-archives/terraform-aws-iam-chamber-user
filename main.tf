data "aws_iam_policy_document" "default" {
  statement {
    actions   = ["ssm:DescribeParameters"]
    resources = ["*"]
    effect    = "Allow"
  }

  statement {
    actions   = ["${var.ssm_actions}"]
    resources = ["${var.ssm_resources}"]
    effect    = "Allow"
  }

  statement {
    actions = ["kms:Decrypt"]

    #resources = ["${var.kms_key_arn}"]
    resources = ["${data.aws_kms_alias.kms_key.arn}"]
    effect    = "Allow"
  }
}

data "aws_kms_alias" "kms_key" {
  name = "${var.kms_key_alias}"
}

module "label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.1.2"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  attributes = "${var.attributes}"
  delimiter  = "${var.delimiter}"
  tags       = "${var.tags}"
  enabled    = "${var.enabled}"
}

# Defines a user that should be able to write to you test bucket
resource "aws_iam_user" "default" {
  count         = "${var.enabled == "true" ? 1 : 0}"
  name          = "${module.label.id}"
  path          = "${var.path}"
  force_destroy = "${var.force_destroy}"
}

# Generate API credentials
resource "aws_iam_access_key" "default" {
  count = "${var.enabled == "true" ? 1 : 0}"
  user  = "${aws_iam_user.default.name}"
}

resource "aws_iam_user_policy" "default" {
  count      = "${var.enabled == "true" ? 1 : 0}"
  name       = "${module.label.id}"
  user       = "${aws_iam_user.default.name}"
  policy     = "${data.aws_iam_policy_document.default.json}"
  depends_on = ["data.aws_kms_alias.kms_key", "data.aws_iam_policy_document.default"]
}
