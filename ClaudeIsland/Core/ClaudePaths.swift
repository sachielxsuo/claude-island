//
//  ClaudePaths.swift
//  ClaudeIsland
//
//  Single source of truth for all Claude config directory paths.
//  The directory name is user-configurable via AppSettings.claudeDirectoryName
//  (defaults to ".claude" for standard Claude Code installations).
//

import Foundation

enum ClaudePaths {

    /// Root Claude config directory, e.g. ~/.claude or ~/.claude-internal
    static var claudeDir: URL {
        FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent(AppSettings.claudeDirectoryName)
    }

    /// Hooks subdirectory, e.g. ~/.claude/hooks
    static var hooksDir: URL {
        claudeDir.appendingPathComponent("hooks")
    }

    /// settings.json path, e.g. ~/.claude/settings.json
    static var settingsFile: URL {
        claudeDir.appendingPathComponent("settings.json")
    }

    /// Projects subdirectory, e.g. ~/.claude/projects
    static var projectsDir: URL {
        claudeDir.appendingPathComponent("projects")
    }

    /// The shell-expanded path written into settings.json hook commands.
    /// Uses "~/" prefix so Claude Code resolves it relative to the user's home.
    static var hookScriptShellPath: String {
        "~/\(AppSettings.claudeDirectoryName)/hooks/claude-island-state.py"
    }
}
