// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLoggerClient",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftLoggerClient",
            targets: ["SwiftLoggerClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura-net.git", .upToNextMinor(from: "1.7.0")),
        .package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", .upToNextMinor(from: "17.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftLoggerClient",
            dependencies: ["KituraNet", "SwiftyJSON"]),
        .testTarget(
            name: "SwiftLoggerClientTests",
            dependencies: ["SwiftLoggerClient"]),
    ]
)
