resource "azurerm_resource_group" "aci_rg" {
  name = var.resource_group_name
  location = var.location

  lifecycle {
    ignore_changes = [tags]
  }

  tags = {
    name            = var.resource_group_name
  }
}

resource "azurerm_storage_account" "aci_storage_account" {
  count                    = length(var.volume) > 0 ? 1 : 0
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.aci_rg.name
  location                 = var.location
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_share" "aci_volume_share" {
  count                = length(var.volume)
  name                 = var.volume[count.index].name
  storage_account_name = azurerm_storage_account.aci_storage_account[0].name
  quota                = var.volume[count.index].quota
}

resource "azurerm_container_group" "aci" {
  name = var.aci_name
  location = var.location
  resource_group_name = azurerm_resource_group.aci_rg.name
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

    dynamic "volume" {
      for_each = var.volume
      content {
        name = volume.value.name
        mount_path = volume.value.mount_path
        share_name = azurerm_storage_share.aci_volume_share[volume.key].name

        storage_account_name = azurerm_storage_account.aci_storage_account[0].name
        storage_account_key = aci_storage_account.aci_storage_account[0].primary_access_key
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

volume =[
  {

  },
  {

  }
]