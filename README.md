# ExplorerKit
Minimal wrapper around the Foursquare Venues API for Searching and Exploring

## Installation
The easiest way the use DetectorKit is with CocoaPods

### Installation with CocoaPods
To integrate DetectorKit into your Xcode project using CocoaPods, specify it in your `Podfile`

```ruby
platform :ios, '10.0'

target 'TargetName' do
  pod 'DetectorKit', :git => 'https://github.com/stevewight/DetectorKit.git
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage
```swift
let client = EKClient()
```
