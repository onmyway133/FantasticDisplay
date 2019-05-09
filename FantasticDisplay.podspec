Pod::Spec.new do |s|
  s.name             = "FantasticDisplay"
  s.summary          = "Fantastic HUD and toast in Swift"
  s.version          = "1.0.0"
  s.homepage         = "https://github.com/onmyway133/FantasticDisplay"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/FantasticDisplay.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.ios.deployment_target = '9.0'
  #s.osx.deployment_target = '10.12'
  #s.tvos.deployment_target = '9.2'
  #s.watchos.deployment_target = "3.0"

  s.requires_arc = true
  s.ios.source_files = 'Sources/{iOS,Shared}/**/*'
  #s.tvos.source_files = 'Sources/{iOS,tvOS,Shared}/**/*'
  #s.osx.source_files = 'Sources/{macOS,Shared}/**/*'
  #s.watchos.source_files = 'Sources/{watchOS,Shared}/**/*'

  s.swift_version = '5.0'
end
