#!/usr/bin/env python3
"""Check that the Flathub release is pinned consistently.

The version in pubspec.yaml is the source of truth; the release tag is
v<version>. Pass the submission manifest(s) generated for Flathub:

    python3 linux/flatpak/check_release.py path/to/io.github.markaleth.Bartender.yml

Without arguments it checks linux/flatpak/io.github.markaleth.Bartender.yml.
flatpak-flutter.yml in this repo is not checked: it can't pin the commit it
is part of, so it tracks `main` and the pinned copy lives in the Flathub repo.

Exits non-zero if any check fails.
"""

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
FLATPAK = ROOT / "linux" / "flatpak"
APP_ID = "io.github.markaleth.Bartender"
APP_REPO = "https://github.com/Markaleth/bartender.git"
METAINFO = FLATPAK / f"{APP_ID}.metainfo.xml"
DEFAULT_MANIFEST = FLATPAK / f"{APP_ID}.yml"

results = []


def check(ok, message):
    results.append((ok, message))


def git(*args):
    proc = subprocess.run(
        ["git", "-C", str(ROOT), *args], capture_output=True, text=True
    )
    return proc.stdout.strip() if proc.returncode == 0 else None


def pubspec_version():
    match = re.search(r"^version:\s*([^\s+]+)", (ROOT / "pubspec.yaml").read_text(), re.M)
    return match.group(1)


def app_source_block(manifest_text):
    """Lines of the git source pointing at the app repo, up to the next source."""
    lines = manifest_text.splitlines()
    for i, line in enumerate(lines):
        if APP_REPO in line:
            start = i
            while start > 0 and "- type:" not in lines[start]:
                start -= 1
            end = i + 1
            while end < len(lines) and "- type:" not in lines[end]:
                end += 1
            return "\n".join(lines[start:end])
    return None


def check_metainfo(version, tag):
    text = METAINFO.read_text()
    check(
        f'<release version="{version}"' in text,
        f"metainfo has a <release> for {version}",
    )
    for url in re.findall(r"<image>(.*?)</image>", text):
        check(f"/{tag}/" in url, f"screenshot URL is pinned to {tag}: {url}")
        path = url.split(f"/{tag}/", 1)[-1]
        check((ROOT / path).is_file(), f"screenshot exists in the repo: {path}")
        if tag_commit(tag):
            check(
                git("cat-file", "-e", f"{tag}:{path}") is not None,
                f"screenshot is in the {tag} tag: {path}",
            )


def tag_commit(tag):
    return git("rev-list", "-n", "1", tag)


def check_tag(tag):
    commit = tag_commit(tag)
    check(commit is not None, f"tag {tag} exists locally")
    remote = git("ls-remote", "--tags", "origin", f"refs/tags/{tag}")
    check(bool(remote), f"tag {tag} is pushed to origin")
    return commit


def check_manifest(path, tag, commit):
    if not path.is_file():
        check(False, f"{path} exists (run flatpak-flutter)")
        return
    block = app_source_block(path.read_text())
    if block is None:
        check(False, f"{path.name}: app git source found")
        return
    check("branch:" not in block, f"{path.name}: app source has no `branch`")
    check(
        re.search(rf"^\s*tag:\s*{re.escape(tag)}\s*$", block, re.M) is not None,
        f"{path.name}: app source tag is {tag}",
    )
    if commit:
        check(
            re.search(rf"^\s*commit:\s*{commit}\s*$", block, re.M) is not None,
            f"{path.name}: app source commit is {commit[:12]}",
        )
    else:
        check(False, f"{path.name}: app source commit matches {tag}")


def main():
    version = pubspec_version()
    tag = f"v{version}"
    print(f"Release {version} (tag {tag})\n")

    check_metainfo(version, tag)
    commit = check_tag(tag)
    manifests = [Path(arg) for arg in sys.argv[1:]] or [DEFAULT_MANIFEST]
    for manifest in manifests:
        check_manifest(manifest, tag, commit)

    for ok, message in results:
        print(f"  {'PASS' if ok else 'FAIL'}  {message}")
    failed = sum(1 for ok, _ in results if not ok)
    print(f"\n{len(results) - failed} passed, {failed} failed")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
