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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", branch: "beta")
	],
	targets: [
		.target(name: "GXUIApplicationWrapper",
				dependencies: [
					"GXUIApplication",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUIApplication",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUIApplication-1.0.0-beta+20230515023341.xcframework.zip",
			checksum: "fc4d15a92b81ffb5013070ee5177b78d7dfe25d93a415524eec4b585c64e9d7c"
		)
	]
)