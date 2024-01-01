// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Platform",
  platforms: [.iOS(.v17)],
  products: [
    .library(name: "HTTPNetwork", targets: ["HTTPNetwork"]),
    .library(name: "HTTPNetworkImpl", targets: ["HTTPNetworkImpl"]),
    .library(
      name: "Platform",
      targets: [
        "HTTPNetwork",
      ]
    ),
    .library(
      name: "PlatformImp",
      targets: [
        "HTTPNetworkImpl",
      ]),
  ],
  targets: [
    .target(name: "HTTPNetwork", dependencies: [], path: "HTTPNetwork/Interface"),
    .target(name: "HTTPNetworkImpl", dependencies: ["HTTPNetwork"], path: "HTTPNetwork/Implementation"),
  ]
)
