// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUIApplication",
	platforms: [.iOS("15.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXUIApplication",
			targets: ["GXUIApplicationWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.2.0-beta.22")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUIApplication-3.2.0-beta.22.xcframework.zip",
			checksum: "28a201586f354890c5f84ce640a476866d69df82ec27a5305a16d9e5c735b977"
		)
	]
)