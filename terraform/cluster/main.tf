terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=3.0.0"
        }
    }
}

#Configure Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {

    name = "${var.cluster_name}-${var.env_name}"
    location = "northeurope"
  
}


resource "azurerm_kubernetes_cluster" "cluster" {

    name = var.cluster_name
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    dns_prefix = "${var.cluster_name}-${var.env_name}"
    http_application_routing_enabled = true

    default_node_pool {
      name = "default"
      node_count = 1
      vm_size = var.instance_type

    }

    identity {
      type = "SystemAssigned"
    }


  
}





