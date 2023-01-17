provider "azurerm" {
  features {}
  skip_provider_registration = true
}

## Import Resource Group Before Apply ##
resource "azurerm_resource_group" "guru" {
  name     = "1-83bd4599-playground-sandbox"
  location = "centralus"

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "guru" {
  name                = "guru-aks"
  location            = azurerm_resource_group.guru.location
  resource_group_name = azurerm_resource_group.guru.name
  dns_prefix          = "guru-k8s"

  default_node_pool {
    name            = "guru"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "Demo"
  }
}
