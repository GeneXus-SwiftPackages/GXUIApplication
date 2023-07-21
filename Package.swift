// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXUIApplication",
	platforms: [.iOS("12.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXUIApplication",
			targets: ["GXUIApplicationWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230721115743")
	],
	targets: [
		.target(name: "GXUIApplicationWrapper",
				dependencies: [
					"GXUIApplication",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUIApplication",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUIApplication-1.0.0-beta.20230721115743.xcframework.zip",
			checksum: "3a1452841916703c043697457c0d1662b7559ca0116c1fa13bdb48521c54dd52"
		)
	]
)