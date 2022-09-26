# citrix-adc-terraform-nativeotp
 This is a simple terraform script to create an AAA virtual server with nFactor authentication, using Citrix NativeOTP as second factor.
 In order for it to work the Single_Auth_CheckOTP.xml file must be uploaded to the /flash/nsconfig/loginschema.
 A SSL certificate is required to be manually bound to the virtual server after running the script.
