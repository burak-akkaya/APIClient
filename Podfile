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

def shared_pods
  pod 'Alamofire', '~> 5.5'
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

  target 'Shared' do
    project 'Shared/Shared.xcodeproj'
    shared_pods
    target 'SharedTests' do
      inherit! :search_paths
      shared_test_pods
      shared_pods
    end
  end

  target 'SampleApp' do
    project 'SampleApp/SampleApp.xcodeproj'
    shared_pods
    target 'SampleAppTests' do
      inherit! :search_paths
      shared_test_pods
      shared_pods
    end

    target 'SampleAppUITests' do
      inherit! :search_paths
    end
  end
end


