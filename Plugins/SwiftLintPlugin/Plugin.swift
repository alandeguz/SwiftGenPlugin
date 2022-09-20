//
// SwiftLintPlugin
// MIT Licence
//

import Foundation
import PackagePlugin

@main
struct SwiftLintPlugin: BuildToolPlugin {
  func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
    return [
      .buildCommand(
        displayName: "Running SwiftLint for \(target.name)",
        executable: try context.tool(named: "swiftlint").path,
        arguments: [
          "lint",
          "--in-process-sourcekit",
          "--path",
          target.directory.string,
          "--config",
          "\(context.package.directory.string)/.swiftlint.yml",
          "--cache-path",
          "\(context.pluginWorkDirectory.string)/cache"
        ],
        environment: [:]
      )
    ]
  }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftLintPlugin: XcodeBuildToolPlugin {
  func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
    return [
      .buildCommand(
        displayName: "Running SwiftLint for \(target.displayName)",
        executable: try context.tool(named: "swiftlint").path,
        arguments: [
          "lint",
          "--in-process-sourcekit",
          "--path",
          context.xcodeProject.directory.string,
          "--config",
          "\(context.xcodeProject.directory.string)/.swiftlint.yml",
          "--cache-path",
          "\(context.pluginWorkDirectory.string)/cache"
        ],
        environment: [:]
      )
    ]
  }
}
#endif
