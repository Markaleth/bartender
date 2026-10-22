---
paths:
  - "lib/core/utils/shell_utils.dart"
  - "lib/data/shell/brew_service.dart"
  - "lib/data/**/*.dart"
---

# Shell Execution & Interfacing with Homebrew

Bartender is fundamentally a wrapper around the local `brew` CLI.

## ShellUtils (`lib/core/utils/shell_utils.dart`)

- **Centralized Execution:** All shell commands MUST go through `ShellUtils.run()` or `ShellUtils.start()`. Do not use `Process.run` directly in other files.
- **Environment Handling:** `ShellUtils` handles setting necessary environment variables (e.g., `HOMEBREW_NO_ANALYTICS`, `HOMEBREW_NO_AUTO_UPDATE`) based on user settings.
- **Path Resolution:** It dynamically resolves the correct path to the `brew` executable (Apple Silicon vs. Intel vs. Linux container).

## BrewService (`lib/data/shell/brew_service.dart`)

- This service acts as the strongly-typed wrapper around specific `brew` commands.
- It returns `ShellCommandResult` which includes `exitCode`, `stdout`, and `stderr`.
- Use this service instead of writing raw `brew ...` string arguments in your UI or Repositories.

## Adding a new Homebrew command

1. Add a method to `BrewService` (e.g., `Future<ShellCommandResult> info(String package)`).
2. Use the internal `runCommand` or `streamCommand` helpers.
3. Parse the `ShellCommandResult.stdout` in your Repository/State object (prefer using `brew ... --json=v2` when available to make parsing robust).
4. Update your State object (via `ChangeNotifier`) to reflect the new data or result.
