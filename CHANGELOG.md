# Changelog

All notable changes to Bartender are listed here. Versions follow [Semantic Versioning](https://semver.org).

## [1.0.0] - 2026-10-22

First public release, published on Flathub.

### Features

- Browse and search formulae and casks, with popular packages from Homebrew's 30, 90 and 365-day analytics.
- Package details: homepage, architectures, version, tap, popularity, license and install method.
- Install, upgrade, pin and uninstall packages through a queue with live `brew` output.
- Installed view with storage use, orphaned dependencies, pending updates, reclaimable space and `brew doctor` warnings.
- Add, inspect, trust and remove taps.
- Settings for a custom brew path, auto cleanup, Homebrew analytics opt-out and opt-in crash reporting.
- Offers to run the official Homebrew installer in a terminal when brew is missing.

### Linux

- Flatpak package (`io.github.markaleth.Bartender`). Inside the sandbox, every `brew` command runs on the host through `flatpak-spawn --host`.
- Native window decorations outside GNOME, so the title bar follows the desktop theme.

[1.0.0]: https://github.com/Markaleth/bartender/releases/tag/v1.0.0
