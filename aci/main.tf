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

resource "aci_tenant" "terraform_tenant" {
  name        = "cfeist_terraform_tenant"   
  description = "Tenant created by TF"
}

#resource "aci_bridge_domain" "terraform_bridgedomain" {
#  tenant_dn   = "${aci_tenant.terraform_tenant.id}"
#  name        = "cfeist_terraform_bridgedomain"
#  description = "BD created by TF"
#}

resource "aci_vrf" "terraform_vrf" {
  tenant_dn = aci_tenant.terraform_tenant.id
  description = "VRF created by TF"
  name = "cfeist_terraform_vrf"
  
}

#resource "aci_application_profile" "terraform_ap" {
#  tenant_dn = aci_tenant.terraform_tenant.id
#  description = "AP created by TF"
#  name = "cfeist_terraform-ap"
#}