output "user_name" {
  value = "${join("", module.chamber_user.aws_iam_user.default.*.name)}"
}

output "user_arn" {
  value = "${join("", module.chamber_user.aws_iam_user.default.*.arn)}"
}

output "user_unique_id" {
  value = "${join("", module.chamber_user.aws_iam_user.default.*.unique_id)}"
}

output "access_key_id" {
  value = "${join("", module.chamber_user.aws_iam_access_key.default.*.id)}"
}

output "secret_access_key" {
  value = "${join("", module.chamber_user.aws_iam_access_key.default.*.secret)}"
}