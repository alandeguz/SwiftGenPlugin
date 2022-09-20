// swift-tools-version: 5.6
import PackageDescription

let package = Package(
  name: "SwiftGenPlugin",
  products: [
    .plugin(name: "SwiftGenPlugin", targets: ["SwiftGenPlugin"]),
    .plugin(name: "SwiftLintPlugin", targets: ["SwiftLintPlugin"])
  ],
  dependencies: [],
  targets: [
    .plugin(
      name: "SwiftGenPlugin",
      capability: .buildTool(),
      dependencies: ["swiftgen"]
    ),
    .plugin(
      name: "SwiftLintPlugin",
      capability: .buildTool(),
      dependencies: ["SwiftLintBinary"]
    ),
    .binaryTarget(
      name: "swiftgen",
      url: "https://github.com/SwiftGen/SwiftGen/releases/download/6.6.2/swiftgen-6.6.2.artifactbundle.zip",
      checksum: "7586363e24edcf18c2da3ef90f379e9559c1453f48ef5e8fbc0b818fbbc3a045"
    ),
    .binaryTarget(
      name: "SwiftLintBinary",
      url: "https://github.com/realm/SwiftLint/releases/download/0.47.1/SwiftLintBinary-macos.artifactbundle.zip",
      checksum: "82ef90b7d76b02e41edd73423687d9cedf0bb9849dcbedad8df3a461e5a7b555"
    ),
  ]
)
