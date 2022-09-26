#basic ldap/ldaps authentication
resource "citrixadc_authenticationldapaction" "tf_authenticationldapaction" {
  name               = "tf_${var.ldap_ip}_ldap_auth_act"
  serverip           = var.ldap_ip
  serverport         = var.ldap_port
  sectype            = (var.ldap_port == 389) ? "PLAINTEXT" : "SSL"
  svrtype            = "AD"
  authentication     = "ENABLED"
  ldapbase           = var.ldap_basedn
  ldapbinddn         = var.ldap_ctxuser
  ldapbinddnpassword = var.ldap_ctxuser_pwd
  ldaploginname      = "samAccountName"
  groupattrname      = "memberOf"
  subattributename   = "cn"
  email              = "mail"
  passwdchange       = (var.ldap_port == 389)?"ENABLED":"DISABLED"
}
#ldap/ldaps action for native otp seed registration
resource "citrixadc_authenticationldapaction" "tf_manageotpldapaction" {
  name               = "tf_${var.ldap_ip}_ldap_manageotp_act"
  serverip           = var.ldap_ip
  serverport         = var.ldap_port
  sectype            = (var.ldap_port == 389) ? "PLAINTEXT" : "SSL"
  svrtype            = "AD"
  authentication     = "DISABLED"
  ldapbase           = var.ldap_basedn
  ldapbinddn         = var.ldap_ctxuser
  ldapbinddnpassword = var.ldap_ctxuser_pwd
  ldaploginname      = "samAccountName"
  groupattrname      = "memberOf"
  subattributename   = "cn"
  email              = "mail"
  otpsecret          = "userParameters"
}
#ldap action used to validate the inserted otp
resource "citrixadc_authenticationldapaction" "tf_checkotpldapaction" {
  name               = "tf_${var.ldap_ip}_ldap_checkotp_act"
  serverip           = var.ldap_ip
  serverport         = var.ldap_port
  sectype            = (var.ldap_port == 389) ? "PLAINTEXT" : "SSL"
  svrtype            = "AD"
  authentication     = "DISABLED"
  ldapbase           = var.ldap_basedn
  ldapbinddn         = var.ldap_ctxuser
  ldapbinddnpassword = var.ldap_ctxuser_pwd
  ldaploginname      = "samAccountName"
  groupattrname      = "memberOf"
  subattributename   = "cn"
  email              = "mail"
  otpsecret          = "userParameters"
  searchfilter       = "userParameters>=#@"
}
