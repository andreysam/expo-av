require 'json'

package = JSON.parse(File.read(File.join(__dir__, '..', 'package.json')))

Pod::Spec.new do |s|
  s.name           = 'EXAV'
  s.version        = package['version']
  s.summary        = package['description']
  s.description    = package['description']
  s.license        = package['license']
  s.author         = package['author']
  s.homepage       = package['homepage']
  s.platform       = :ios, '12.0'
  s.source         = { git: 'https://github.com/expo/expo.git' }
  s.static_framework = true

  s.dependency 'ExpoModulesCore'
  s.dependency 'ReactCommon'
  # 'React-runtimeexecutor' is added only for prebuilding purposes as this process cannot resolve transitive headers' paths at the time of writing.
  # This dependency is transitively included via following chain: 'ReactCommon' -> 'ReactCommon/turbomodule' -> 'React-cxxreact' -> 'React-runtimeexecutor'.
  # TODO: remove once prebuilding starts supporting resolution of transitive dependencies
  s.dependency 'React-runtimeexecutor'

  s.source_files = "#{s.name}/**/*.{h,m,mm}"
end
