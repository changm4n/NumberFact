// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Domain", targets: ["Usecase"]),
        .library(name: "DomainImpl", targets: ["UsecaseImpl"]),
    ],
    dependencies: [
      .package(name: "Platform", path: "../Platform")
    ],
    targets: [
        .target(name: "Usecase", path: "Usecase/Interface"),
        .target(name: "UsecaseImpl", dependencies: ["Usecase", "Platform"], path: "Usecase/Implementation"),
    ]
)
