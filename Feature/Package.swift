// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Feature",
  platforms: [.iOS(.v17)],
  products: [
    .library(
      name: "Feature",
      targets: ["Home", "Detail"]),
    .library(
      name: "FeatureImpl",
      targets: ["HomeImpl", "DetailImpl"]),
  ],
  dependencies: [
    .package(path: "../SharedPackage"),
    //    .package(path: "../Domain"),
  ],
  targets: [
    .target(
      name: "Home",
      dependencies: [
        .product(name: "SharedPackage", package: "SharedPackage"),
      ],
      path: "Home/Interface"
    ),
    .target(
      name: "HomeImpl",
      dependencies: [
        "Home",
        "Detail",
        .product(name: "SharedPackage", package: "SharedPackage"),
      ],
      path: "Home/Implementation"
    ),
    .testTarget(
      name: "HomeTests",
      dependencies: [
        "Home",
        "DetailTestSupport",
        .product(name: "SharedPackage", package: "SharedPackage")
      ],
      path: "Home/Tests"
    ),
    .target(
      name: "Detail",
      dependencies: [
        .product(name: "SharedPackage", package: "SharedPackage"),
      ],
      path: "Detail/Interface"
    ),
    .target(
      name: "DetailImpl",
      dependencies: [
        "Detail",
        .product(name: "SharedPackage", package: "SharedPackage"),
      ],
      path: "Detail/Implementation"
    ),
    .target(
      name: "DetailTestSupport",
      dependencies: [
        "Detail",
        .product(name: "SharedPackage", package: "SharedPackage"),
      ],
      path: "Detail/TestSupport"
    ),
  ]
)
