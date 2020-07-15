# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

use_frameworks!

def frameworks
  pod 'Alamofire', '~> 5.2'
  pod 'SDWebImage', '~> 5.8'
end

target 'MovieDB' do
  frameworks
end

target 'MovieDBTests' do
  inherit! :search_paths
  
  frameworks
end