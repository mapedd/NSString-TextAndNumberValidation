Pod::Spec.new do |s|
  s.name         = "NSString+TextAndNumberValidation"
  s.version      = "0.0.1"
  s.summary      = "NSString+TextAndNumberValidation - simple text and number validation for popular  formats: email, telephone, IBAN, LUHN"
  s.homepage     = "http://github.com/mapedd/NSString+TextAndNumberValidation"
  s.license      = 'Apache'
  s.author       = { "Tomek Kuzma" => "mapedd@mapedd.com" }
  s.source       = { :git => "http://EXAMPLE/NSString+TextAndNumberValidation.git", :tag => "0.0.1" }
  s.ios.deployment_target = '4.0'
  s.osx.deployment_target = '10.6'
  s.source_files = 'NSString+TextAndNumberValidation.{h,m}'
  s.requires_arc = true
end
