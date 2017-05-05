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

## Credentials

The functionality for ExplorerKit is accessed through the EKClient class. To create an instance of EKClient you first need to get some credentials:

1. Create a [Foursquare developer account](https://developer.foursquare.com/)
2. Set up a new app
3. Take note of your apps "CLIENT_ID", "CLIENT_SECRET" and the api "VERSION"

## Usage

Create an instance of EKClient by passing in your Foursquare clientID, clientSecret and version number:

```swift
let client = EKClient(
            clientID: YOUR_FOURSQUARE_CLIENT_ID,
            clientSecret: YOUR_FOURSQUARE_CLIENT_SECRET,
            version: YOUR_FOURSQUARE_VERSION
) 
```

Set the clients delegate and make sure your current class conforms to the EKClientDelegate protocol:

```swift
client.delegate = self
```

Set the location you would like to explore or search for venues:

```swift
client.setLocation(
  lat: 52.364146,
  lng: 4.844100
)
```

Now you can either search a given location:

```swift
client.search("coffee")
```

Or you can explore a given location:

```swift
client.explore()
```

The delegate methods for getting notification when the api call has completed:

```swift
func clientExploreComplete() {
  let venues = client.venues
  print("Venues explored: \(venues)")
}

func clientSearchComplete() {
    let venues = client.venues
    print("Venues searched: \(venues)")
}
```

You can now access information about a given from the Venue object:

```swift
let venue = venues.first!

print("venue id: \(venue.id)")
print("venue name: \(venue.name)")
print("venue url: \(venue.url)")
```
The Venue object also holds a VenueLocation object and an array of VenueCategory objects:

```swift
let location = venue.location

print("city: \(location.city)")
print("state: \(location.state)")
print("distance: \(location.distance)")

let category = venue.categories.first!

print('category name: \(category.name)")
```

For all the properties check out the classes source:

* [Venue](https://github.com/stevewight/ExplorerKit/blob/master/ExplorerKit/Venue.swift)
* [VenueLocation](https://github.com/stevewight/ExplorerKit/blob/master/ExplorerKit/VenueLocation.swift)
* [VenueCategory](https://github.com/stevewight/ExplorerKit/blob/master/ExplorerKit/VenueCategory.swift)

## License

ExplorerKit is released under the ***MIT*** license. See LICENSE for details.
