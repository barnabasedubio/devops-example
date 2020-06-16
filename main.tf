provider "azurerm" {
  version = "2.5.0"
  features {}
}

resource "azurerm_resource_group" "tf_test" {
  name                = "tf_main_rg"
  location            = "Germany West Central"
}

resource "azurerm_container_group" "tfcg_test" {
  name                = "weatherapi"
  location            = "North Europe"
  resource_group_name = azurerm_resource_group.tf_test.name

  ip_address_type     = "public"
  dns_name_label      = "barnabasedubiowa" //wa stands for weatherapi
  os_type             = "Linux"

  container {
    name              = "weatherapi"
    image             = "barnabasedubio/weatherapi"
    cpu               = "1"
    memory            = "1"
    ports {
      port            = 80
      protocol        = "TCP"
    }
  }
}