data "aws_iam_policy_document" "default" {
  statement {
    actions = ["${var.ssm_actions}"]

    resources = ["${var.ssm_resources}"]
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
  source        = "git::https://github.com/cloudposse/terraform-aws-iam-system-user.git?ref=tags/0.2.2"
  namespace     = "${var.namespace}"
  stage         = "${var.stage}"
  name          = "${var.name}"
  attributes    = "${var.attributes}"
  tags          = "${var.tags}"
  enabled       = "${var.enabled}"
  force_destroy = "${var.force_destroy}"
  path          = "${var.path}"
  policy        = "${data.aws_iam_policy_document.default.json}"
}
