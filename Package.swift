// swift-tools-version:5.10
import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "AutoCodable",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "AutoCodable",
            targets: ["AutoCodable"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "510.0.0"),
    ],
    targets: [
        .macro(
            name: "AutoCodableMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ]
        ),
        .target(name: "AutoCodable", dependencies: ["AutoCodableMacros"]),
        .testTarget(
            name: "AutoCodableTests",
            dependencies: [
                "AutoCodableMacros",
                "AutoCodable",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
