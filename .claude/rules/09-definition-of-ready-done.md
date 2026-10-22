# Task Lifecycle: Definition of Ready → Plan/Execute → Definition of Done

## Definition of Ready — generic, confirm before writing any code

- [ ] Intent understood in your own words.
- [ ] Scope named explicitly — which files/packages/screens are in play. For an unfamiliar zone, confirm via `codegraph_explore` (`.claude/rules/14-codegraph-context.md`).
- [ ] Layer impact known (UI / Provider / Repository).
- [ ] Open questions resolved or explicitly accepted as risk.

### + Feature addenda

- [ ] Edge cases cross-checked.
- [ ] UI/UX constraints known (desktop layout, etc).
- [ ] State management approach defined (Provider).

### + Refactor addenda

- [ ] Zone mapped: every file in scope, its role, and its dependents in/out — enumerate via `codegraph_explore` / `codegraph_impact`.
- [ ] Deviations from `01`–`04` conventions listed.

### + SDK/Dependency Upgrade addenda

- [ ] Exact scope named: `pubspec.yaml` packages or Flutter SDK version.
- [ ] Compatibility checked.

## Plan → Execute

- **Feature:** Implement per architecture rules. Run `dart run build_runner build --delete-conflicting-outputs` if modifying models.
- **Refactor:** execute one staged step at a time. After each step, run tests.
- **Upgrade:** bump one axis, then verify (`flutter clean`, `flutter pub get`, `flutter test`).

## Definition of Done — generic, confirm before calling anything complete

- [ ] Code follows the applicable rules (`01`–`04`).
- [ ] Methods are kept atomic; distinct logic blocks are extracted into well-named private helper functions.
- [ ] Code generation run (`dart run build_runner build --delete-conflicting-outputs`) if any `freezed` or generated models were touched.
- [ ] Tests added/updated and passing.
- [ ] Build succeeds with no newly introduced errors (`flutter analyze`).
- [ ] Standard task closeout complete (see `.claude/rules/08-workflow-memory.md`).
