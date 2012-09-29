Pod::Spec.new do |s|
  s.name         = "NSString+TextAndNumberValidation"
  s.version      = "0.0.1"
  s.summary      = "A short description of NSString+TextAndNumberValidation."
  s.homepage     = "http://github.com/mapedd/NSString-TextAndNumberValidation"
  s.license      = 'Apache'
  s.author       = { "Tomek Kuzma" => "mapedd@sezamkowa.net" }
  s.source       = { :git => "https://github.com/mapedd/NSString-TextAndNumberValidation.git", :tag => "0.0.1" }
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.source_files = 'NSString+TextAndNumberValidation.{h,m}'
  s.requires_arc = false
end
