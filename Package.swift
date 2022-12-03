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
	dependencies: [
		.package(url: "https://github.com/arnold-plakolli/SwiftUIExtensions.git", branch: "main")
	],
	targets: [
		.target(name: "SwiftUIExtensions", path: "Sources"),
	]
)
