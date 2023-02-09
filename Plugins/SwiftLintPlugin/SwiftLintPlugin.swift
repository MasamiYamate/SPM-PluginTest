//
//  File.swift
//  
//
//  Created by Masami on 2023/02/09.
//

import PackagePlugin

@main
struct SwiftLintPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        return [
            .prebuildCommand(displayName: "Run MyPlugin",
                             executable: Path("/usr/bin/make"),
                             arguments: [
                                "hoge",
                                "-C", "\(context.package.directory)",
                                "WORKDIR=\(context.package.directory)",
                                "FRAMEWORKNAME=XCDemo",
                                "DST=\(context.pluginWorkDirectory.string)",
                                "PATH=\(context.package.directory)"
                             ],
                             outputFilesDirectory: context.pluginWorkDirectory),
                ]
    }
}