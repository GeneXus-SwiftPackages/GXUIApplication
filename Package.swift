// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUIApplication",
	platforms: [.iOS("13.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXUIApplication",
			targets: ["GXUIApplicationWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-rc.2")
	],
	targets: [
		.target(name: "GXUIApplicationWrapper",
				dependencies: [
					"GXUIApplication",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUIApplication",
			url: "https://pkgs.genexus.dev/iOS/preview/GXUIApplication-3.0.0-rc.2.xcframework.zip",
			checksum: "1adba9377a3064df74f7b6b499cc37bbd18b9a0afecd6beb2f4551833b5f6c09"
		)
	]
)