terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "0.7.0"
    }
  }
}

provider "aci" {
  # cisco-aci user name
  username = "${var.username}"
  # cisco-aci password
  password = "${var.password}"
  # cisco-aci url
  url      =  "${var.apic_url}"
  insecure = true
}

resource "aci_tenant" "cfeist_terraform_tenant" {
  name        = "cfeist_terraform_tenant"   
  description = "This tenant was created by the Terraform ACI provider"
}

resource "aci_bridge_domain" "cfeist_terraform_bridgedomain" {
  tenant_dn   = "${aci_tenant.cfeist_terraform_tenant.id}"
  name        = "cfeist_terraform_bridgedomain"
  description = "This bridge domain was created by the Terraform ACI provider"
}

resource "aci_subnet" "cfeist_terraform_subnet" {
  bridge_domain_dn                    = "${aci_bridge_domain.cfeist_terraform_bridgedomain.id}"
  ip                                  = "10.199.199.1/24"
  scope                               = "private"
  description                         = "This subject was created by Terraform"
} 