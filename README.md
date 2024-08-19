# RSFUIPassportScanner
A SwiftUI wrapper for MRZScanner Library. MRZScanner allows scanning documents via [MRZ](https://en.wikipedia.org/wiki/Machine-readable_passport) using [ Vision API](https://developer.apple.com/documentation/vision/vnrecognizetextrequest).

## Requirements
* iOS 16.0+


## Installation guide
### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/n1kitus/RSFUIPassportScanner.git", .upToNextMajor(from: "1.0.0"))
]
```
*The library has an SPM dependency for [MRZScanner](https://github.com/appintheair/MRZScanner) and [MRZParser](https://github.com/appintheair/MRZParser) for MRZ code parsing.*

## Usage
Add `NSCameraUsageDescription` key to your `Info.plist` file to prevent your app from crashing
Add `PassportScannerView` to your SwiftUI view. It will automatically request camera access if needed.
                                                                                         
## License
The library is distributed under the MIT [LICENSE](https://opensource.org/licenses/MIT).
