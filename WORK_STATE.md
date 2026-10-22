# Work State

## Task: Flathub packaging

- **Branch:** `flathub-packaging`
- **Flavor:** Feature
- **Status:** Code + packaging done; Flatpak build unverified, waiting on user decisions (see Open questions)
- **App ID:** `io.github.markaleth.Bartender` (everywhere, incl. GTK `APPLICATION_ID`)

### Goal

Make Bartender submittable to Flathub. Inside the Flatpak sandbox, host commands (`brew`, `du`, `stat`, `sh`, terminal launchers) run on the host via `flatpak-spawn --host`. The repo carries the manifest, desktop entry, AppStream metainfo, icons, and a written justification for the `org.freedesktop.Flatpak` sandbox escape. Submitting the PR to flathub/flathub stays with the user.

### Definition of Ready

- [x] Intent understood: Flathub-ready packaging + host-exec bridge.
- [x] Scope: `lib/core/utils/shell_utils.dart`, `lib/data/shell/brew_service.dart` (installer launch), `linux/CMakeLists.txt` (app ID), new `linux/flatpak/`, tests under `test/core/utils/`.
- [x] Layer impact: core util + data service only; no UI/Provider changes.
- [x] Open questions accepted as risk:
  - Flathub builds offline; Flutter SDK + pub deps must be pinned sources. Generated with `flatpak-flutter`, which must run on Linux.
  - `flatpak-spawn --host` does not forward the caller's environment; Homebrew env vars must go through `--env=` flags.
  - No Flatpak tooling on the Mac; test builds run in the Linux container.
- [x] Edge cases: brew not on host PATH (fallback paths), custom brew path setting, installer terminal launch, URL opening (portal via `url_launcher`).
- [x] UI/UX: none.
- [x] State management: none.

### Plan

1. [x] `ShellUtils`: generalise the distrobox-only host bridge into a `HostBridge` (none / distrobox / flatpak); pass env via `--env=` for Flatpak.
2. [x] `BrewService.launchHomebrewInstaller`: use the same bridge.
3. [x] Rename GTK `APPLICATION_ID`.
4. [x] `linux/flatpak/`: manifest, `.desktop`, metainfo, icons, build README.
5. [x] `FLATHUB_JUSTIFICATION.md`.
6. [x] Analyze + tests (57 passing, analyze clean). Changelog on merge.
7. [x] App icon: `assets/branding/app_icon.svg` (source, with background), rendered to macOS AppIcon set + `linux/flatpak/icons/`; GTK window icon set from `APPLICATION_ID`. Background-free copy `assets/icons/app_icon.svg` registered in-app as `appIcon`; `IconWidget(tinted: false)` keeps its colours.
8. [x] macOS parity: `AppInfo.xcconfig` is the single source for name (`Bartender`), bundle ID (`io.github.markaleth.Bartender`) and copyright; target overrides removed; RunnerTests/scheme renamed. Release build verified.
9. [ ] Sandboxed `flatpak-builder` build in the Linux container.

### Test plan

- `test/core/utils/shell_utils_test.dart`:
  - no bridge → command is executable + args unchanged.
  - distrobox → `distrobox-host-exec <exe> <args>`.
  - flatpak → `flatpak-spawn --host --env=K=V… <exe> <args>`.
  - env values with `=`/spaces stay single `--env=` arguments.

### Definition of Done

- [x] Code follows `01`–`04`; methods atomic.
- [x] Code generation run (none touched).
- [x] Tests added and passing.
- [x] `flutter analyze` clean.
- [ ] CHANGELOG entry; this block cleared.

### Open questions / blockers

- Repo `Markaleth/bartender` is private (GitHub 404). Flathub builds from public source.
- License: MIT added (`LICENSE`, `THIRD_PARTY_NOTICES.md`, metainfo). `linux_icon.svg` is MIT; its copyright holder still needs adding to THIRD_PARTY_NOTICES.md.
- Screenshot missing at `linux/flatpak/screenshots/main.png` (URL pinned to tag `v1.0.0`).
- Release `v1.0.0` not tagged yet. `linux/flatpak/check_release.py` verifies tag, commit pin, metainfo release and screenshot.
- `sqlite3` build hook downloads SQLite; offline build likely needs `source: system`. Unverified.
