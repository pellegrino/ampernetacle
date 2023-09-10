terraform {
  backend "http" {
    address        = "https://api.tfstate.dev/github/v1"
    lock_address   = "https://api.tfstate.dev/github/v1/lock"
    unlock_address = "https://api.tfstate.dev/github/v1/lock"
    lock_method    = "PUT"
    unlock_method  = "DELETE"
    username       = "pellegrino/ampernetacle"
  }

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.114.0"
    }
  }
}

provider "oci" {
  auth                = "SecurityToken"
  config_file_profile = "default"
  region              = "eu-amsterdam-1"
}