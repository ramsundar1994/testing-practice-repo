resource "azurerm_resource_group" "name" {
  name     = "example-resources"
  location = "East US"
}
resource "azurerm_resource_group" "name1" {
  name     = "example-resources1"
  location = "East US"
}
#step2 : Vnet and subnet creations 
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-01"
  resource_group_name = azurerm_resource_group.rg-name.name
  location            = azurerm_resource_group.rg-name.location
  address_space       = ["10.0.0.0/24"]
}
resource "azurerm_subnet" "subnet-a" {
  name                 = "subnet-A"
  resource_group_name  = azurerm_resource_group.rg-name.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/28"]
}