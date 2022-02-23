source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!

platform :ios, '13.0'
workspace 'APIClient'

def common_pods
  pod 'SwiftyMocky'
end

def shared_test_pods
  common_pods
end

def guideline_pods
  pod 'SwiftLint'
end

def base_pods
  guideline_pods
  common_pods
end

abstract_target 'App' do
  use_frameworks!
  base_pods

  
  target 'Core' do
    project 'Core/Core.xcodeproj'

    target 'CoreTests' do
      inherit! :search_paths
      shared_test_pods
    end
  end

  target 'APIClient' do
    project 'APIClient/APIClient.xcodeproj'

    target 'APIClientTests' do
      inherit! :search_paths
      shared_test_pods
    end
  end
end


