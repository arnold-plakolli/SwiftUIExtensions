// swift-tools-version: 5.7

import PackageDescription

let package = Package(
	name: "SwiftUIExtensions",
	products: [
		.library(name: "SwiftUIExtensions", targets: ["SwiftUIExtensions"]),
	],
	targets: [
		.target(name: "SwiftUIExtensions", path: "Sources"),
	]
)
