Pod::Spec.new do |s|

  s.name         = "ExplorerKit"
  s.version      = "0.0.1"
  s.summary      = "Swift wrapper for Foursquares Venues API"
  s.description  = "Easily search and explore Foursquares Venues API"
  s.homepage     = "http://www.github.com/stevewight"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Steve Wight" => "stevendouglaswight@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/stevewight/ExplorerKit.git", :tag => "0.0.1" }
  s.source_files = "ExplorerKit/**/*.{h,m,swift}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
