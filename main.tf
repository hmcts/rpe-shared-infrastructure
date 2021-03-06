provider azurerm {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.product}-${var.env}"
  location = var.location

  tags = var.common_tags
}

module "key-vault" {
  source              = "git@github.com:hmcts/cnp-module-key-vault?ref=azurermv2"
  product             = "${var.product}-shared"
  env                 = var.env
  tenant_id           = var.tenant_id
  object_id           = var.jenkins_AAD_objectId
  resource_group_name = azurerm_resource_group.rg.name

  # DTS Platform Operations
  product_group_object_id    = "e7ea2042-4ced-45dd-8ae3-e051c6551789"
  common_tags                = var.common_tags
  create_managed_identity    = true
}