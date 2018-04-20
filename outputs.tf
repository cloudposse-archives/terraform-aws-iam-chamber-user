output "user_name" {
  value = "${module.chamber_user.user_name}"
}

output "user_arn" {
  value = "${module.chamber_user.user_arn}"
}

output "user_unique_id" {
  value = "${module.chamber_user.user_unique_id}"
}

output "access_key_id" {
  value = "${module.chamber_user.access_key_id}"
}

output "secret_access_key" {
  value = "${module.chamber_user.secret_access_key}"
}