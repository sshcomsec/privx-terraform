output "privx-public-dns" {
  value = azurerm_public_ip.privx-public.fqdn
}

output "database_password" {
  value = random_password.database_password.result
}

output "superuser_password" {
  value = random_password.superuser_password.result
}