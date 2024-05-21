// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUIApplication",
	platforms: [.iOS("12.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXUIApplication",
			targets: ["GXUIApplicationWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.0.0-beta.34")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUIApplication-2.0.0-beta.34.xcframework.zip",
			checksum: "216a4ede64d795c509f83c0f1e7b6d8edbdd9c0056a3010afbb4eacba2bac8a3"
		)
	]
)