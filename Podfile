# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

def shared_pods
  pod 'Alamofire', '5.4'
  pod 'Swinject', '2.7.1'
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
end

def testing_pods
  pod 'RxBlocking', '6.2.0'
  pod 'RxTest', '6.2.0'
end

target 'TheMovieDB' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  shared_pods
  # Pods for TheMovieDB

  target 'TheMovieDBTests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

  target 'TheMovieDBUITests' do
    # Pods for testing
    testing_pods
  end
end
