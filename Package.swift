// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "BottleSong",
    products: [
        .library(
            name: "BottleSong",
            targets: ["BottleSong"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BottleSong",
            dependencies: []),
        .testTarget(
            name: "BottleSongTests",
            dependencies: ["BottleSong"]),
    ]
)
