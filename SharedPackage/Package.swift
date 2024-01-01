// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SharedPackage",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "SharedPackage",
            targets: ["SharedPackage"]),
    ],
    dependencies: [
      .package(url: "https://github.com/nsoojin/CombineRIBs", exact: "2.1.0"),
      .package(url: "https://github.com/roberthein/TinyConstraints", exact: "4.0.2"),
    ],
    targets: [
      .target(name: "SharedPackage", 
              dependencies: [
                .product(name: "CombineRIBs", package: "CombineRIBs"),
                .product(name: "TinyConstraints", package: "TinyConstraints"),
              ],
              path: "SharedPackage"),
    ]
)
