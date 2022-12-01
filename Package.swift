// swift-tools-version: 5.7

import PackageDescription

let package = Package(
	name: "SwiftUIExtensions",
	platforms: [
		.iOS(.v13)
	],
	products: [
		.library(name: "SwiftUIExtensions", targets: ["SwiftUIExtensions"]),
	],
	targets: [
		.target(name: "SwiftUIExtensions", path: "Sources"),
	]
)
