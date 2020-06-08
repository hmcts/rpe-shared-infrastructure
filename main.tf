provider "azurerm" {
  version = "1.44.0"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.product}-${var.env}"
  location = "${var.location}"

  tags = "${var.common_tags}"
}

module "key-vault" {
  source              = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  product             = "${var.product}-shared"
  env                 = "${var.env}"
  tenant_id           = "${var.tenant_id}"
  object_id           = "${var.jenkins_AAD_objectId}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  # dcd_cc-dev group object ID
  product_group_object_id    = "c36eaede-a0ae-4967-8fed-0a02960b1370"
  common_tags                = "${var.common_tags}"
  managed_identity_object_id = "${var.managed_identity_object_id}"
}