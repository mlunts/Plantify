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

def helper_pods
  pod 'Then'
  pod 'SnapKit', '~> 4.0'
end

def required_pods
  framework_pods
  helper_pods
end

target 'Plantify' do
  required_pods
  
  target 'PlantifyTests' do
      inherit! :search_paths
      required_pods
  end
  
end
