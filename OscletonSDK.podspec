#
# Be sure to run `pod lib lint OscletonSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OscletonSDK'
  s.version          = '0.1.0'
  s.summary          = 'Ableton Live companion SDK for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description  = "Oscleton SDK provides a complete solution to communicate with Ableton Live on iOS devices."

  s.homepage         = 'https://github.com/ArthurVimond/oscleton-ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author           = { 'Arthur Vimond' => 'arthurvimond@gmail.com' }
  s.source           = { :git => 'https://github.com/ArthurVimond/oscleton-ios-sdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version    = '4.2'

  s.source_files = 'OscletonSDK/Classes/**/*.{swift,h}'
  
  # s.resource_bundles = {
  #   'OscletonSDK' => ['OscletonSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency "Swinject", "~> 2.5.0"
  s.dependency "SwiftOSC", "~> 1.2"

end
