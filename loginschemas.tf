#manage user devices schema
resource "citrixadc_authenticationloginschema" "tf_authtomanageotp_schema" {
  name                 = "tf_AuthToManageOTP_Schema"
  authenticationschema = "LoginSchema/SingleAuthManageOTP.xml"
}
#schema for first step authentication
resource "citrixadc_authenticationloginschema" "tf_ldapfirststep_schema" {
  name                 = "tf_FirstStepAuth_Schema"
  authenticationschema = "LoginSchema/SingleAuth.xml"
  ssocredentials       = "YES"
}
#schema for otp authentication
resource "citrixadc_authenticationloginschema" "tf_ldapsecondstep_schema" {
  name                 = "tf_SeconStepAuth_Schema"
  authenticationschema = "Single_Auth_Ita_CheckOtp.xml"
}
