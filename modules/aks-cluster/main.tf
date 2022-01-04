locals {
  cluster_name = "${var.company_name}-${var.short_region}-${var.env}-${var.project}-aks"
}

data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = local.cluster_name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = var.resource_group_name
  dns_prefix          = local.cluster_name

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  automatic_channel_upgrade = "stable"

  addon_profile {
    oms_agent {
      enabled = true
      log_analytics_workspace_id = var.la_workspace_resource_id
    }
  }


  tags = {
    env = var.env
    project = var.project_name
  }
}
