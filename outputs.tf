output "user_name" {
  value       = module.chamber_user.user_name
  description = "Normalized IAM user name"
}

output "user_arn" {
  value       = module.chamber_user.user_arn
  description = "The ARN assigned by AWS for the user"
}

output "user_unique_id" {
  value       = module.chamber_user.user_unique_id
  description = "The user unique ID assigned by AWS"
}

output "access_key_id" {
  value       = module.chamber_user.access_key_id
  description = "The access key ID"
}

output "secret_access_key" {
  value       = module.chamber_user.secret_access_key
  description = "The secret access key. This will be written to the state file in plain-text"
}

