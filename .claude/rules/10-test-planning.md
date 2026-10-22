---
paths:
  - "test/**"
  - "**/*_test.dart"
---

# Test Planning

## Before writing implementation code

For any new or changed State object or Repository, write the plan into `WORK_STATE.md` → "Test plan" first, then implement tests alongside the code.

## Conventions — match existing tests exactly

- Framework: **flutter_test**.
- Mocking: **mockito** or **mocktail**. Use `GenerateMocks` where applicable.
- Test class naming: `{class_name}_test.dart` mirroring `lib` structure inside `test/`.
- Mock external dependencies like `BrewService` or `ShellUtils` to avoid actual shell execution during tests.

## Running tests

Ensure generated files are up to date before testing. Run `dart run build_runner build --delete-conflicting-outputs` if you modified any `freezed` classes.

Use `flutter test`. If iterating on a single file, use `flutter test test/path/to/file_test.dart`.
