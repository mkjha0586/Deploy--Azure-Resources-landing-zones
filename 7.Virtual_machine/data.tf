data "azurerm_resource_group" "datarg" {
    name="new-rg"
  
}

data "azurerm_network_interface" "datanic" {
    for_each = var.vm
  name                = each.value.nicname
  resource_group_name = data.azurerm_resource_group.datarg.name
}  


data "azurerm_key_vault" "datakv" {
  name                = "testkevault005"
  resource_group_name = data.azurerm_resource_group.datarg.name

} 
data "azurerm_key_vault_secret" "datakey" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.datakv.id
  }




