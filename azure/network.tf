resource "azurerm_resource_group" "rg" {
  name     = "Privx-Poc-Group"
  location = var.region
  tags = {
    environment = "Privx-Poc"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "Privx-Poc-net"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "privx-public" {
  location            = azurerm_resource_group.rg.location
  name                = "Privx-public"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  domain_name_label   = "privx-poc"
}

resource "azurerm_network_interface" "privx-nic" {
  name                = "Privx-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "privx-nic"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.privx-public.id
  }
}
