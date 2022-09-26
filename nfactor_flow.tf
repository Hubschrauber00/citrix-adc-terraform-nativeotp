resource "citrixadc_authenticationpolicylabel_authenticationpolicy_binding" "tf_registerotp_ldapregisterotppol" {
  labelname  = citrixadc_authenticationpolicylabel.tf_registerotp.labelname
  policyname = citrixadc_authenticationpolicy.tf_registerotpldappol.name
  priority   = 100
}
resource "citrixadc_authenticationpolicylabel_authenticationpolicy_binding" "tf_secondstepauth_checkotpldappol" {
  labelname  = citrixadc_authenticationpolicylabel.tf_secondstepauth.labelname
  policyname = citrixadc_authenticationpolicy.tf_checkotpldappol.name
  priority   = 100
}

resource "citrixadc_authenticationpolicylabel_authenticationpolicy_binding" "tf_firststepauth_ldapauthpol" {
  labelname  = citrixadc_authenticationpolicylabel.tf_firststepauth.labelname
  policyname = citrixadc_authenticationpolicy.tf_ldapauthenticationpolicy.name
  priority   = 100
  nextfactor = citrixadc_authenticationpolicylabel.tf_is2faenabled.labelname
}

resource "citrixadc_authenticationpolicylabel_authenticationpolicy_binding" "tf_authtomanageotp_ldapauthpol" {
  labelname  = citrixadc_authenticationpolicylabel.tf_authtomanageotp.labelname
  policyname = citrixadc_authenticationpolicy.tf_ldapauthenticationpolicy.name
  priority   = 100
  nextfactor = citrixadc_authenticationpolicylabel.tf_registerotp.labelname
}

resource "citrixadc_authenticationpolicylabel_authenticationpolicy_binding" "tf_OTPManage_SelectManage_bind" {
  labelname  = citrixadc_authenticationpolicylabel.tf_optmanageorauthenticate.labelname
  policyname = citrixadc_authenticationpolicy.tf_selectManageDevice.name
  priority   = 100
  nextfactor = citrixadc_authenticationpolicylabel.tf_authtomanageotp.labelname
}

resource "citrixadc_authenticationpolicylabel_authenticationpolicy_binding" "tf_OTPManage_SelectAuth_bind" {
  labelname  = citrixadc_authenticationpolicylabel.tf_optmanageorauthenticate.labelname
  policyname = citrixadc_authenticationpolicy.tf_selectOTPAuthentication.name
  priority   = 110
  nextfactor = citrixadc_authenticationpolicylabel.tf_firststepauth.labelname
}

resource "citrixadc_authenticationpolicylabel_authenticationpolicy_binding" "tf_is2faenabled_isfauser_bind" {
  labelname = citrixadc_authenticationpolicylabel.tf_is2faenabled.labelname
  policyname =   citrixadc_authenticationpolicy.tf_is2faUser.name
  priority = 100
  nextfactor = citrixadc_authenticationpolicylabel.tf_secondstepauth.labelname
}