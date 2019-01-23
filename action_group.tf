module "action-group" {
  source   = "git@github.com:hmcts/cnp-module-action-group"
  location = "global"
  env      = "${var.env}"

  resourcegroup_name     = "${azurerm_resource_group.rg.name}"
  action_group_name      = "RPE alerts - ${var.env}"
  short_name             = "rpe_alerts"
  email_receiver_name    = "Platform engineering alerts"
  email_receiver_address = "${var.action_group_email}"
}
