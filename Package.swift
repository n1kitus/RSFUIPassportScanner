// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RSFUIPassportScanner",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RSFUIPassportScanner",
            targets: ["RSFUIPassportScanner"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appintheair/MRZScanner.git", .upToNextMajor(from: "1.1.2")),
        .package(url: "https://github.com/appintheair/MRZParser.git", .upToNextMajor(from: "1.1.2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RSFUIPassportScanner",
            dependencies: ["MRZParser", "MRZScanner"]
        ),
        .testTarget(
            name: "RSFUIPassportScannerTests",
            dependencies: ["RSFUIPassportScanner"]),
    ]
)
