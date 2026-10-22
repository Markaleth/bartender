# Bartender — Agent Instructions

Welcome to the Bartender project. This is a Flutter macOS/linux desktop application that acts as a graphical frontend for the Homebrew package manager.

## Environment:

When running the local environment is linux, you are running in a container.
The path to Flutter within the container is: `/run/media/system/The_Vault/flutter/bin/flutter`
Account for this when executing Flutter commands. Check the environment at the beginning of each session and **REMEMBER** this information so it only needs to be done once.

## Core Rules & Architecture

When working in this project, you must adhere to the following core principles:

1. **Desktop First**: This is a macOS/linux application. Prioritize high information density, hover states, and keyboard/mouse interactions over touch-friendly mobile layouts.
2. **Architecture**: Feature-first architecture using `provider` for state management and `ChangeNotifier`. Repositories execute commands via `ShellUtils` / `BrewService`.
3. **Code Generation (`freezed`)**: We heavily rely on code generation for state models. You MUST run `dart run build_runner build --delete-conflicting-outputs` before running tests or claiming a task is done.
4. **Styling & Icons**:
   - ALWAYS use `BartenderContext` (e.g., `context.bodyM`, `context.windowWidth`) from `lib/theme/bartender_context.dart`.
   - Strictly use `AppColors` from `lib/core/constants/app_colors.dart`.
   - Prefer SVG icons from `lib/core/constants/app_icons.dart` rendered via `IconWidget`.
5. **Shell Execution**: Do not use raw `Process.run`. Always use `ShellUtils` and `BrewService`.

## Detailed Guidelines (.claude/rules)

For detailed workflows, always refer to the specific rule files in `.claude/rules/`:

- `00-project-overview.md`: Project structure and anti-patterns.
- `01-architecture.md`: Provider and layer locations.
- `02-state-management.md`: Dependency injection and consuming state.
- `03-shell-execution.md`: Homebrew shell interfacing.
- `04-ui-patterns.md`: Desktop UI, components, and styling strictness.
- `08-workflow-memory.md`: Tracking work in `WORK_STATE.md` and `CHANGELOG.md`.
- `09-definition-of-ready-done.md`: Task lifecycle (DoR / DoD).
- `10-test-planning.md`: Unit test conventions (`flutter_test`, `mockito`).
- `14-codegraph-context.md`: When to use CodeGraph over grep.

## Specialized Skills (.claude/skills, .kilo/skills)

This workspace is equipped with several skills tailored for Flutter. They live in `.claude/skills/` (Claude Code) and are mirrored in `.kilo/skills/` (Kilo) and `.opencode/skills/` (opencode). **ALWAYS use the `skill` tool** to load a skill when your task matches its description.

Workflow skills (in `.claude/skills/`):

- `start-work`: Start any unit of work — branch, confirm goal, DoR/DoD, implement, PR.
- `resume-work`: Resume from `WORK_STATE.md`.
- `refine-work`: Batch refinement assessment of backlog items.

Flutter skills include:

- `flutter-add-widget-preview`: Creating UI components with interactive previews.
- `flutter-add-widget-test`: Writing component-level tests.
- `flutter-fix-layout-issues`: Fixing RenderFlex overflows or layout constraints.
- `flutter-apply-architecture-best-practices`: Refactoring or structuring features.
- `flutter-build-responsive-layout`: Adaptive layouts.
- `flutter-use-http-package`: Networking/REST APIs (if applicable).
- `flutter-implement-json-serialization`: Data models.
- `flutter-add-integration-test`: End-to-end testing flows.

<!-- CODEGRAPH_START -->

## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.

<!-- CODEGRAPH_END -->
