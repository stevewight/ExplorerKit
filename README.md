# ExplorerKit
Minimal wrapper around the Foursquare Venues API for Searching and Exploring

## Installation
The easiest way the use ExplorerKit is with CocoaPods

### Installation with CocoaPods
To integrate ExplorerKit into your Xcode project using CocoaPods, specify it in your `Podfile`

```ruby
platform :ios, '10.0'

target 'TargetName' do
  pod 'ExplorerKit', :git => 'https://github.com/stevewight/ExplorerKit.git
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
