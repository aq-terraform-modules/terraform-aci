resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location

  lifecycle {
    ignore_changes = [tags]
  }

  tags = {
    name            = var.resource_group_name
  }
}

resource "azurerm_container_group" "aci" {
  name = var.aci_name
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type = var.ip_address_type
  dns_name_label = var.dns_name_label
  os_type = var.os_type
  restart_policy = var.restart_policy

  container {
    name = var.container_name
    image = var.container_image
    cpu = var.cpu
    memory = var.memory
    environment_variables = var.environment_variables
    secure_environment_variables = var.secure_environment_variables

    dynamic "ports" {
      for_each = var.container_ports
      content {
        port = ports.value.port
        protocol = ports.value.protocol
      }
    }
  }

  lifecycle {
    ignore_changes = [tags]
  }

  tags = {
    name            = var.aci_name
  }
}