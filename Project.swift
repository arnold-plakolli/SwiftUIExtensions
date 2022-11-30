import ProjectDescription

let project = Project(
	name: "Project",
	organizationName: "Arnold Plakolli",
	options: .options(
		automaticSchemesOptions: .disabled,
		textSettings: .textSettings(usesTabs: true)
	),
	targets: [
		Target(
			name: "SwiftUIExtensions",
			platform: .iOS,
			product: .framework,
			bundleId: "com.arnoldplakolli.SwiftUIExtensions",
			infoPlist: .default,
			sources: ["Sources/**"]
		),
		Target(
			name: "DemoApp",
			platform: .iOS,
			product: .app,
			bundleId: "com.arnoldplakolli.DemoApp",
			infoPlist: .extendingDefault(with: [
				"UILaunchScreen": .dictionary([:])
			]),
			sources: ["DemoApp/Sources/**"],
			dependencies: [.project(target: "SwiftUIExtensions", path: ".")]
		)
	],
	schemes: [
		Scheme(
			name: "SwiftUIExtensions",
			shared: true,
			buildAction: .buildAction(targets: ["SwiftUIExtensions"])
		),
		Scheme(
			name: "DemoApp",
			shared: true,
			buildAction: .buildAction(targets: ["DemoApp"]),
			runAction: .runAction(executable: "DemoApp")
		)
	],
	fileHeaderTemplate: .string("""
				//
				//  Copyright © ___ORGANIZATIONNAME___. All rights reserved.
				//
				""")
)
