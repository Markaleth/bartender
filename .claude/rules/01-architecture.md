---
paths:
  - "**/*.dart"
---

# Architecture — Feature-First + Provider

```
UI (Widgets) → State Objects (ChangeNotifier/Providers) → Repositories → BrewService (ShellUtils)
```

## Layer locations

- **Features:** `lib/features/<feature_name>/` — Contains the UI widgets, states, and feature-specific logic.
- **Data/Repositories:** `lib/data/` — Services that interact with the system or external APIs (e.g., `BrewService`, `LocalPackageOperations`).
- **Core:** `lib/core/` — Utilities, constants, and extensions used app-wide.

## Naming Conventions

- State Objects: `{Feature}State` (e.g., `PackageStates`, `TrendingPackageState`).
- Services: `{Domain}Service` or `{Domain}Operations`.
- UI Widgets: `{Feature}View` or `{Feature}Widget`.

## Methods & Encapsulation

- **Atomic Functions:** Functions and methods should be as atomic and single-purpose as possible.
- If a method contains distinct logical chunks (e.g., executing a command, formatting the output, and separately updating a notifier), extract those chunks into their own private methods (e.g., `_updateNotifierWithoutSync()`, `_parseCommandResult()`).
- Avoid bloated functions. Prefer composing small, well-named private helper methods to make the core logic readable at a glance.

## State Management (Provider)

- Use `ChangeNotifier` for complex state that requires updates across multiple widgets.
- Expose public getters for state variables.
- Call `notifyListeners()` when state changes.
- Consume state in UI using `context.watch<T>()` for rebuilds, or `context.read<T>()` for one-time reads (like button presses).

## Repositories & Services

- Repositories encapsulate the logic of fetching/parsing data.
- They should not hold UI state.
- They primarily interact with `BrewService` or `ShellUtils` to execute shell commands.
