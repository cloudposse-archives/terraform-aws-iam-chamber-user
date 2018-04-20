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

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "ssm:DescribeParameters",
      "ssm:GetParameters",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "kms:Decrypt",
    ]

    resources = [
      "${var.kms_key_arn}",
    ]
  }
}

module "chamber_user" {
  source    = "git::https://github.com/cloudposse/terraform-aws-iam-system-user.git?ref=master"
  name      = "${var.name}"
  enabled   = "${var.enabled}"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  policy    = "${data.aws_iam_policy_document.default.json}"
}
