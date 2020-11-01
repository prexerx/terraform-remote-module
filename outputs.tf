# output 
output "nic_id" {
    value = azurerm_network_interface.nic.id
}

output "public_ip_address" {
    value = data.azurerm_public_ip.publicip.ip_address
}