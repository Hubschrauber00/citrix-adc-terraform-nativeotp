#basic ldap authentication policy
resource "citrixadc_authenticationpolicy" "tf_ldapauthenticationpolicy" {
  name   = "tf_${var.ldap_ip}_ldap_auth_pol"
  action = citrixadc_authenticationldapaction.tf_authenticationldapaction.name
  rule   = "true"
}

#ldap policy that registers the otp seed
resource "citrixadc_authenticationpolicy" "tf_registerotpldappol" {
  name   = "tf_${var.ldap_ip}_ldap_registerotp_pol"
  action = citrixadc_authenticationldapaction.tf_manageotpldapaction.name
  rule   = "true"
}

#ldap policy that checks the otp
resource "citrixadc_authenticationpolicy" "tf_checkotpldappol" {
  name   = "tf_${var.ldap_ip}_ldap_checkotp_pol"
  action = citrixadc_authenticationldapaction.tf_checkotpldapaction.name
  rule   = "true"
}

#policy that checks if the NSC_TASS cookie has been set in order to redirect the user to the page used to register the user's device
resource "citrixadc_authenticationpolicy" "tf_selectManageDevice" {
  name   = "tf_selectManageDevice"
  action = "NO_AUTHN"
  rule   = "http.req.cookie.value(\"NSC_TASS\").eq(\"manageotp\")"
}

#policy used to redirect the user to the actual login page
resource "citrixadc_authenticationpolicy" "tf_selectOTPAuthentication" {
  name   = "tf_selectOTPAuthentication"
  action = "NO_AUTHN"
  rule   = "true"
}

#this policy is used to check if the users belong to the 2fa active directory group. If they are, they're asked to input the otp.
#If they're not, users are logged in without being asked the second step. This is used to soft migrate users to 2fa solution
resource "citrixadc_authenticationpolicy" "tf_is2faUser" {
  name   = "tf_is2faUser"
  action = "NO_AUTHN"
  rule   = "AAA.USER.GROUPS.CONTAINS(\"${var.mfagroup}\")"
}

#root policy to be bound to the virtual server. This particular naming convention is used to trick the GUI to show the nfactor flow in the nfactor visualizer
resource "citrixadc_authenticationpolicy" "tf_rootnfactorpolicy" {
  name   = "${citrixadc_authenticationpolicylabel.tf_optmanageorauthenticate.labelname}_0"
  action = "NO_AUTHN"
  rule   = "true"
}
