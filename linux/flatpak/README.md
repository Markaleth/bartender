# Flatpak / Flathub packaging

| File | Purpose |
|---|---|
| `flatpak-flutter.yml` | Input manifest. Run `flatpak-flutter` on it to get the offline manifest. |
| `io.github.markaleth.Bartender.desktop` | Desktop entry |
| `io.github.markaleth.Bartender.metainfo.xml` | AppStream metadata (the Flathub store page) |
| `icons/` | App icons, installed into `hicolor` |
| `FLATHUB_JUSTIFICATION.md` | Text for the permissions section of the Flathub PR |

Inside the sandbox, `ShellUtils` detects `/.flatpak-info` and runs every host command through `flatpak-spawn --host`, passing Homebrew env vars as `--env=` flags.

## Build locally (Linux)

Flathub builds without network access, so the Flutter SDK and every pub package must be pinned sources. [flatpak-flutter](https://github.com/TheAppgineer/flatpak-flutter) generates them.

```sh
cd linux/flatpak
alias flatpak-flutter='docker run --rm -v "$PWD":/usr/src/flatpak -u `id -u`:`id -g` theappgineer/flatpak-flutter:latest'
flatpak-flutter --app-module bartender flatpak-flutter.yml
```

This writes `io.github.markaleth.Bartender.yml` plus a `generated/` folder (pub sources, patches and the Flutter SDK module). Rerun it whenever `pubspec.lock` or the Flutter version changes.

flatpak-flutter clones the app source at its `commit:`, reading `pubspec.lock` from there. To build local changes, push them, set `commit:` in `flatpak-flutter.yml` to the pushed SHA, and rerun it.

```sh
flatpak-builder --repo=repo --force-clean --sandbox --user --install \
  --install-deps-from=flathub build io.github.markaleth.Bartender.yml
flatpak run io.github.markaleth.Bartender
```

`--sandbox` matches Flathub's offline build.

### On Bazzite (or another Fedora Atomic image)

Bazzite already has Flatpak with Flathub, Podman, and Homebrew at `/home/linuxbrew/.linuxbrew`, so it can build the Flatpak and test it against a real host `brew` without layering packages.

```sh
flatpak install --user flathub org.flatpak.Builder
alias flatpak-builder='flatpak run org.flatpak.Builder'
alias flatpak-flutter='podman run --rm --userns=keep-id -v "$PWD":/usr/src/flatpak:Z theappgineer/flatpak-flutter:latest'
```

With these aliases, the commands above work unchanged.

Before submitting, check the installed Flatpak against the host's Homebrew:

- Settings shows the resolved brew path (`/home/linuxbrew/.linuxbrew/bin/brew`).
- Search, install, upgrade and uninstall a small formula; the live output streams.
- Add and remove a tap.
- The health view loads disk usage.
- "Reveal in file manager" opens the package folder.
- External links open in the browser.

### Screenshots

Flathub reviews screenshots against its [quality guidelines](https://docs.flathub.org/docs/for-app-authors/metainfo-guidelines/quality-guidelines):

- Take them from the installed Flatpak, on Linux, in English.
- Capture only the window, with its native title bar, shadow and rounded corners. Don't maximize, crop or edit.
- Keep the window at 1000x700 or smaller.
- Use the platform's default settings (on KDE, the Breeze window decoration and default accent color and fonts).
- Show real content, not empty states. Put the best shot first; 3-6 in total.
- Give each one a one-sentence caption in the metainfo, with no full stop.

`screenshot.sh` does the capture on KDE Plasma: it resizes the running Bartender window to 1000x700, focuses it, and saves it with Spectacle (decorations and shadow included). Open the screen you want, then run:

```sh
linux/flatpak/screenshot.sh main   # -> linux/flatpak/screenshots/main.png
```

Every file needs a matching `<screenshot>` in the metainfo, served from the release tag. Retake them whenever the interface visibly changes.

### Validate

Validate metadata with:

```sh
flatpak run --command=flatpak-builder-lint org.flatpak.Builder appstream io.github.markaleth.Bartender.metainfo.xml
flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest io.github.markaleth.Bartender.yml
```

## Known risks for the offline build

- **`sqlite3` 3.x** downloads a prebuilt SQLite through a build hook. Offline, it must use the runtime's SQLite instead (`hooks: user_defines: sqlite3: source: system` in `pubspec.yaml`). Not yet verified.
- **Native plugins** that fetch code during CMake (check `jni`, `sentry_flutter`) need their downloads added as manifest sources. Run a verbose build (`flutter build linux --release --no-pub --verbose`) to find them.

## Submitting

The version in `pubspec.yaml` drives the release: tag `v<version>`, a matching `<release>` in the metainfo, and screenshots served from that tag.

1. Build and test the Flatpak, and take the screenshot (see above).
2. Add a `<release>` entry to the metainfo for the new version, then commit and merge to `main`.
3. Tag and push: `git tag v<version> && git push origin v<version>`.
4. In your fork of [flathub/flathub](https://github.com/flathub/flathub) (branch `new-pr`), copy `flatpak-flutter.yml`. Replace the `commit:` line on the app source with `tag: v<version>` and `commit: <sha>` (`git rev-list -n 1 v<version>`), then run `flatpak-flutter` there.
5. Check the pins:
   ```sh
   python3 linux/flatpak/check_release.py <flathub-fork>/io.github.markaleth.Bartender.yml
   ```
   Every line must pass.
6. Open the PR with the generated manifest and its JSON sources. Paste `FLATHUB_JUSTIFICATION.md` into the PR description.
7. To get the verified badge for `io.github.markaleth`, log in to Flathub with the `Markaleth` GitHub account after the app is published.

The pinned manifest lives only in the Flathub repo: a commit can't contain its own hash, so the copy here tracks `main`.

## Icon

The app icon source is `assets/branding/app_icon.svg`. `assets/icons/app_icon.svg` is the same artwork without the background, used in-app as `appIcon`; keep the two in sync. After editing the branding SVG, re-render the PNGs into `macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_{16..1024}.png` and `linux/flatpak/icons/{128,256,512}.png`, using any SVG rasterizer (e.g. `rsvg-convert -w <size> -h <size>`).
