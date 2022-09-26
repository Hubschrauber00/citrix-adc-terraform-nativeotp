#root policy label
resource "citrixadc_authenticationpolicylabel" "tf_optmanageorauthenticate" {
  labelname   = "tf_OTPManageOrAuthenticate__root"
  loginschema = "LSCHEMA_INT"
}

#authenticate to manage otp policy label
resource "citrixadc_authenticationpolicylabel" "tf_authtomanageotp" {
  labelname   = "tf_AuthToManageOTP_tf_OTPManageOrAuthenticate"
  loginschema = citrixadc_authenticationloginschema.tf_authtomanageotp_schema.name
}

#in this step users can register they're device
resource "citrixadc_authenticationpolicylabel" "tf_registerotp" {
  labelname   = "tf_DeviceRegistration_tf_OTPManageOrAuthenticate"
  loginschema = "LSCHEMA_INT"
}

#first step for ldap authentication
resource "citrixadc_authenticationpolicylabel" "tf_firststepauth" {
  labelname   = "tf_FirstStepAuth_tf_OTPManageOrAuthenticate"
  loginschema = citrixadc_authenticationloginschema.tf_ldapfirststep_schema.name
}

#decision block to check user group membership. This particular naming is used to make the nfactor visualizer show this policy label as a decision block
resource "citrixadc_authenticationpolicylabel" "tf_is2faenabled" {
  labelname   = "_db_tf_is2faEnabled_tf_OTPManageOrAuthenticate"
  loginschema = "LSCHEMA_INT"
}

#second step for otp authentication
resource "citrixadc_authenticationpolicylabel" "tf_secondstepauth" {
  labelname   = "tf_SecondStepAuth_tf_OTPManageOrAuthenticate"
  loginschema = citrixadc_authenticationloginschema.tf_ldapsecondstep_schema.name
}


