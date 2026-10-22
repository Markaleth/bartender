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

This writes `io.github.markaleth.Bartender.yml` plus `pubspec-sources.json` and the Flutter SDK module. Rerun it whenever `pubspec.lock` or the Flutter version changes.

```sh
flatpak-builder --repo=repo --force-clean --sandbox --user --install \
  --install-deps-from=flathub build io.github.markaleth.Bartender.yml
flatpak run io.github.markaleth.Bartender
```

`--sandbox` matches Flathub's offline build. Validate metadata with:

```sh
flatpak run --command=flatpak-builder-lint org.flatpak.Builder appstream io.github.markaleth.Bartender.metainfo.xml
flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest io.github.markaleth.Bartender.yml
```

## Known risks for the offline build

- **`sqlite3` 3.x** downloads a prebuilt SQLite through a build hook. Offline, it must use the runtime's SQLite instead (`hooks: user_defines: sqlite3: source: system` in `pubspec.yaml`). Not yet verified.
- **Native plugins** that fetch code during CMake (check `jni`, `sentry_flutter`) need their downloads added as manifest sources. Run a verbose build (`flutter build linux --release --no-pub --verbose`) to find them.

## Submitting

The version in `pubspec.yaml` drives the release: tag `v<version>`, a matching `<release>` in the metainfo, and screenshots served from that tag.

1. Make the repository public.
2. Take a screenshot of the app running on Linux and save it as `screenshots/main.png` here. Flathub shows it on the store page, from the URL in the metainfo. Use the default window decorations and no desktop background.
3. Add a `<release>` entry to the metainfo for the new version, then commit and merge to `main`.
4. Tag and push: `git tag v<version> && git push origin v<version>`.
5. In your fork of [flathub/flathub](https://github.com/flathub/flathub) (branch `new-pr`), copy `flatpak-flutter.yml`. Replace `branch: main` on the app source with `tag: v<version>` and `commit: <sha>` (`git rev-list -n 1 v<version>`), then run `flatpak-flutter` there.
6. Check the pins:
   ```sh
   python3 linux/flatpak/check_release.py <flathub-fork>/io.github.markaleth.Bartender.yml
   ```
   Every line must pass.
7. Open the PR with the generated manifest and its JSON sources. Paste `FLATHUB_JUSTIFICATION.md` into the PR description.
8. To get the verified badge for `io.github.markaleth`, log in to Flathub with the `Markaleth` GitHub account after the app is published.

The pinned manifest lives only in the Flathub repo: a commit can't contain its own hash, so the copy here tracks `main`.

## Icon

The app icon source is `assets/branding/app_icon.svg`. `assets/icons/app_icon.svg` is the same artwork without the background, used in-app as `appIcon`; keep the two in sync. After editing the branding SVG, re-render the PNGs into `macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_{16..1024}.png` and `linux/flatpak/icons/{128,256,512}.png`, using any SVG rasterizer (e.g. `rsvg-convert -w <size> -h <size>`).
