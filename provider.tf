terraform {
  required_providers {
    citrixadc = {
      source  = "citrix/citrixadc"
      version = "1.20.0"
    }
  }
}

provider "citrixadc" {
  endpoint             = var.adcaddress
  username             = var.adcusername
  password             = var.adcpwd
  insecure_skip_verify = true
}

