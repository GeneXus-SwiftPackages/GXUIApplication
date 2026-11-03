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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "5.0.0-rc.13")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXUIApplication-5.0.0-rc.13.xcframework.zip",
			checksum: "247aab072c5e375a31dd3f1b8c5d87aee1cb740cf7f6b04f3e48cc3d9f11159c"
		)
	]
)