resource "azurerm_resource_group" "testrg1" {
  name     = "testrg1"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "vnet1"
  location            = azurerm_resource_group.testrg1.location
  resource_group_name = azurerm_resource_group.testrg1.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"] 

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    environment = "Production"
  }
}