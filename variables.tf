variable "common_tags" {
  type = "map"
}

variable "product" {}
variable "env" {}

variable "location" {
  default = "UK South"
}

variable "action_group_email" {
  default = "hmctsplatformengineering@gmail.com"
}
