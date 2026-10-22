<p align="center">
  <img src="assets/branding/app_icon.svg" width="128" alt="Bartender icon">
</p>

<h1 align="center">Bartender</h1>

<p align="center">A desktop app for browsing, installing and managing Homebrew packages on Linux and macOS.</p>

Bartender is a graphical frontend for [Homebrew](https://brew.sh). It has no package logic of its own: every action runs `brew` against your existing installation, so anything you do in Bartender is the same as running the command yourself.

## Features

- **Browse packages**: search formulae and casks, with popular and trending packages from Homebrew's analytics.
- **Library**: see what's installed, update or pin versions, and update everything at once.
- **Active queue**: installs, upgrades and uninstalls run in a queue with live output.
- **Taps**: add, inspect and remove taps, including install size and broken packages.
- **System health**: outdated packages, `brew doctor` warnings, disk usage and cleanup.
- **Settings**: custom brew path, auto cleanup, Homebrew analytics opt-out, and opt-in crash reporting.

## Requirements

- Homebrew installed on the machine. If it's missing, Bartender offers to run the official installer in a terminal.
- Linux (x86_64 or aarch64) or macOS 10.15+.

## Install

- **Linux**: Flathub release in progress. Until then, build from source (below) or build the Flatpak locally ([`linux/flatpak/README.md`](linux/flatpak/README.md)).
- **macOS**: build from source. Signed releases aren't available yet.

## Build from source

Requires Flutter 3.41 (Dart 3.10+).

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d linux    # or: -d macos
```

Release builds: `flutter build linux --release` or `flutter build macos --release`.

## Development

- Run the tests with `flutter test` (regenerate code first if models changed).
- Set `SIMULATE_NO_BREW=1` to test the "Homebrew not installed" flow on a machine that has it.
- Running the app inside a distrobox container in debug mode sends commands to the host through `distrobox-host-exec`, the same way the Flatpak uses `flatpak-spawn --host`.

## Packaging

- Flatpak / Flathub: [`linux/flatpak/README.md`](linux/flatpak/README.md)
- App ID on both platforms: `io.github.markaleth.Bartender`
- Icon source: [`assets/branding/app_icon.svg`](assets/branding/app_icon.svg)

## License

[MIT](LICENSE). Bundled icons from Lucide and others keep their own licenses; see [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).
