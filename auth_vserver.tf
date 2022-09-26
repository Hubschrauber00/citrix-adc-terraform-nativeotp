#AAA virtual server
resource "citrixadc_authenticationvserver" "tf_authenticationvserver" {
  name           = "tf_NativeOTPAuthVserver"
  servicetype    = "SSL"
  authentication = "ON"
  ipv46          = "0.0.0.0"
  port           = 0
}
#authentication profile
resource "citrixadc_authenticationauthnprofile" "tf_authenticationprofile" {
  name                 = "tf_authenticationprofile"
  authnvsname          = citrixadc_authenticationvserver.tf_authenticationvserver.name
  authenticationhost   = var.authenticationhost
  authenticationdomain = var.authenticationdomain
}
#virtual server to root policy of the nfactor binding
resource "citrixadc_authenticationvserver_authenticationpolicy_binding" "tf_authvsrv_rootnfactor" {
  name     = citrixadc_authenticationvserver.tf_authenticationvserver.name
  policy   = citrixadc_authenticationpolicy.tf_rootnfactorpolicy.name
  priority = 100
  nextfactor = citrixadc_authenticationpolicylabel.tf_optmanageorauthenticate.labelname
}
