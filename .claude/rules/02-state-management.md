---
paths:
  - "**/*.dart"
---

# State Management (Provider)

Bartender uses the `provider` package for state management and dependency injection.

## Setup

- Providers are typically registered at the top of the widget tree (in `main.dart` or a main app wrapper).
- Use `MultiProvider` to register multiple services and state objects.
- Use `ChangeNotifierProvider` for state objects that extend `ChangeNotifier`.
- Use `Provider` for read-only services (like `BrewService` or `ShellUtils`).

## Consuming State

- **Read-only (No Rebuilds):** Use `context.read<YourState>()` or `Provider.of<YourState>(context, listen: false)`. Ideal for callbacks (e.g., `onPressed`).
- **Reactive (Rebuilds):** Use `context.watch<YourState>()` or `Consumer<YourState>`.
- **Targeted Rebuilds:** Use `Selector<YourState, SpecificValue>` if you only want to rebuild when a specific property changes.

## Adding new state

1. Create a class extending `ChangeNotifier` or a `freezed` data class for immutable state.
2. If using `freezed` or generated files (`.g.dart`, `.freezed.dart`), you MUST run `dart run build_runner build --delete-conflicting-outputs`.
3. Add your state fields and mutation methods.
4. Call `notifyListeners()` at the end of mutation methods (if using `ChangeNotifier`).
5. Register it in `MultiProvider` in `main.dart`.
