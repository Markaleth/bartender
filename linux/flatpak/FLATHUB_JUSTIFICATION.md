# Flathub permission justification

For the "Permissions" section of the Flathub submission PR.

## `--talk-name=org.freedesktop.Flatpak`

Bartender is a graphical frontend for [Homebrew](https://brew.sh). It has no package management logic of its own: every action (search, install, upgrade, uninstall, tap, cleanup, `brew doctor`) is a `brew` command run against the user's existing Homebrew installation.

That installation lives on the host, normally in `/home/linuxbrew/.linuxbrew`, with its own toolchain and relocation assumptions. Homebrew cannot run inside the Flatpak sandbox:

- `brew` and the formulae it installs are host binaries, linked against the host's glibc and Homebrew's own prefix. They do not run against the Freedesktop runtime.
- Installing a formula writes to the Homebrew prefix and Cellar, and runs post-install steps that expect the host environment.
- Bundling a separate Homebrew inside the Flatpak would manage a private copy that the user's shell never sees, which defeats the app's purpose.

So Bartender uses `flatpak-spawn --host` to run commands on the host. This is the same pattern Flathub already accepts for apps whose job is to drive host tooling, such as IDEs and terminals.

### What runs on the host

Every host command goes through one function (`ShellUtils` in `lib/core/utils/shell_utils.dart`):

| Command | Purpose |
|---|---|
| `brew …` | All package operations |
| `sh -c 'command -v brew'`, `test -x <path>` | Locating the brew executable |
| `du`, `stat` | Disk usage and timestamps of Homebrew paths |
| `xdg-open <path>` | "Reveal in file manager" for a package's install folder |
| A terminal emulator running the official Homebrew install script | Only when the user clicks "Install Homebrew" on first launch |

Commands are executed as argument lists, never through string interpolation. URLs open through the `url_launcher` portal and are restricted to `http`/`https`.

### Why narrower alternatives don't work

- **`--filesystem=/home/linuxbrew`:** gives read and write access to the files, but the binaries still cannot execute inside the sandbox.
- **A portal:** no portal exists for running a host package manager.

## `--share=network`

The app fetches package metadata and analytics counts from `formulae.brew.sh` for the browse and trending views, checks the latest Homebrew release on the GitHub API, and loads package icons. Crash reports go to Sentry only when the user has enabled them in Settings.

## No `--filesystem` access

The app needs no filesystem access of its own. It only touches Homebrew's files through host commands.
