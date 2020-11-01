# Create public IP
resource "azurerm_public_ip" "publicip" {
  name                = "${var.prefix}-PublicIP"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
}

data "azurerm_public_ip" "publicip" {
  name                = azurerm_public_ip.publicip.name
  resource_group_name = azurerm_public_ip.publicip.resource_group_name
}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                      = "${var.prefix}-NIC"
  location                  = var.location
  resource_group_name       = var.resource_group

  ip_configuration {
    name                          = "${var.prefix}-NIC-Confg"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}
