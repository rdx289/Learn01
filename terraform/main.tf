provider "azurerm" {
     features {}
   }
   resource "azurerm_resource_group" "rg" {
     name     = "rg-github-actions-demo"
     location = "East US"
   }
