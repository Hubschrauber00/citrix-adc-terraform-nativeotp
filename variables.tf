variable "adcaddress" {
  type = string
}
variable "adcusername" {
  type    = string
  default = "nsroot"
}

variable "adcpwd" {
  type = string
}

variable "ldap_ip" {
  type = string
}

variable "ldap_port" {
  type = number
}

variable "ldap_basedn" {
  type = string
}

variable "ldap_ctxuser" {
  type = string
}

variable "ldap_ctxuser_pwd" {
  type = string
}

variable "authenticationhost" {
  type = string
}

variable "authenticationdomain" {
  type = string
}
variable "mfagroup"{
  type = string
}