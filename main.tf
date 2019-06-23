data "aws_iam_policy_document" "default" {
  statement {
    actions   = ["ssm:DescribeParameters"]
    resources = ["*"]
    effect    = "Allow"
  }

  statement {
    actions   = var.ssm_actions
    resources = var.ssm_resources
    effect    = "Allow"
  }

  statement {
    actions   = ["kms:Decrypt"]
    resources = [var.kms_key_arn]
    effect    = "Allow"
  }
}

module "chamber_user" {
  source        = "git::https://github.com/rverma-nikiai/terraform-aws-iam-system-user.git?ref=master"
  namespace     = var.namespace
  stage         = var.stage
  name          = var.name
  attributes    = var.attributes
  tags          = var.tags
  enabled       = var.enabled
  force_destroy = var.force_destroy
  path          = var.path
}

resource "aws_iam_user_policy" "chamber_user" {
  count  = var.enabled == "true" ? 1 : 0
  name   = module.chamber_user.user_name
  user   = module.chamber_user.user_name
  policy = data.aws_iam_policy_document.default.json
}

