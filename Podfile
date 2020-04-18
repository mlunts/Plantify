platform :ios, '12.0'
swift_version = '5'
inhibit_all_warnings!
use_frameworks!

def framework_pods
  pod 'SwiftyJSON', '~> 4.2'
  pod 'SwiftGen'
  pod 'Moya'
  pod 'SwiftLint'
end

def required_pods
  framework_pods
end

target 'Plantify' do
  required_pods
end
