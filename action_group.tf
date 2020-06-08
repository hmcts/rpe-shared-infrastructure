module "action-group" {
  source   = "git@github.com:hmcts/cnp-module-action-group"
  location = "global"
  env      = "${var.env}"

  resourcegroup_name     = "${azurerm_resource_group.rg.name}"
  action_group_name      = "RPE alerts - ${var.env}"
  short_name             = "rpe_alerts"
  email_receiver_name    = "Platform engineering alerts"
  email_receiver_address = "${data.azurerm_key_vault_secret.actionGroupEmail.value}"
}

data "azurerm_key_vault_secret" "actionGroupEmail" {
  name      = "actionGroupEmail"
  key_vault_id = "${module.key-vault.key_vault_id}"
}
