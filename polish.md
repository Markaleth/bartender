# UI/UX Polish Notes

## 1. Tap Card Improvements & Sync Button

**Additional useful info for tap_card.dart:**
- Disk size (tap git repo size on disk)
- Split package counts: formulae vs casks (e.g., "42 formulae, 18 casks")
- Git branch (if not on default/main/master branch)
- Last commit date (relative: "Updated 2 hours ago")

**Force Sync Button:** 
**Remove it.** Homebrew's `brew update` updates ALL taps simultaneously. Syncing a single tap requires manual `git pull` in the tap directory, which is not a standard Homebrew operation and adds confusion. The global "Sync Taps" action in the view header is sufficient and more intuitive.

## 2. Zap vs Uninstall

**Zap is a real Homebrew feature (not for lulz):**
- **Normal uninstall:** `brew uninstall --cask <cask>` - Removes the application bundle but may leave behind:
  - Preference files (`~/Library/Preferences/`)
  - Application support (`~/Library/Application Support/`)
  - Caches (`~/Library/Caches/`)
  - Saved states
- **Zap:** `brew uninstall --zap <cask>` - "Nuke from orbit" approach:
  - Removes the application bundle AND all associated files
  - Deletes preferences, caches, logs, and other support files
  - Equivalent to using AppCleaner or similar cleanup tools
  - **Only works for Casks** (GUI applications), not Formulae (CLI tools)

## 3. Source vs Precompiled Package Indicator

Replace confusing text labels with intuitive icons + tooltips:

- **Precompiled (Bottle):** 
  - Icon: 📦 (package/box)
  - Text: "Ready-to-run" or "Fast Install"
  - Tooltip: "This package is available as a pre-compiled binary. It will download and install quickly without needing to compile from source."

- **Source Build:**
  - Icon: 🔨 (hammer/wrench)
  - Text: "Build from source" or "Custom Build"
  - Tooltip: "This package must be compiled from source code on your machine. This takes longer but allows for customization and is necessary when no pre-compiled binary is available for your system architecture."

## 4. Library View Actions Viability

**Keep:**
- **Launch/Open:** For Casks (GUI apps) - opens the application. Trash for CLI Formulae (no GUI to launch).
- **Pin/Lock Version:** `brew pin <package>` works natively - essential for preventing unwanted updates.
- **Open Directory:** `open $(brew --prefix <package>)` - Extremely useful for locating config files, logs, etc.
- **Reinstall:** Rename "Verify/Repair" to "Reinstall" - `brew reinstall <package>` redownloads and reinstalls, fixing corruption or incomplete installs.

**Remove/Change:**
- **Downgrade/Rollback:** Remove. Homebrew intentionally removed `brew switch` (2018). Downgrading requires manually tapping old versions or using `brew install <package>@<version>` which is complex and error-prone. Not worth UI space.
- **Clear Cache/Reset:** Remove from individual package view. Cache operations are system-wide (`brew cleanup`). Global "System Health" section is the appropriate place for cleanup operations.

## 5. Inspector Pane Information Feasibility

**Can be reliably obtained from Homebrew:**
- ✅ **Version Comparison:** `brew outdated --json` or `brew info --json <package>` shows current vs latest
- ✅ **Disk Usage:** `brew info --json <package>` includes `installed_size` (disk space used by package)
- ✅ **Installation Path:** `brew --prefix <package>` or from JSON `installed` path
- ✅ **Dependencies:** `brew deps --tree <package>` or `brew info --json` gives `dependencies`, `recommended`, `optional`
- ✅ **Installation Date:** Available in `brew info --json` as `installed[0].installed_on_timestamp`
- ❌ **Last Used:** **Not available.** Homebrew does not track when packages were last executed/used. Would require OS-level auditing (complex, privacy concerns, unreliable).
- ⚠️ **Changelogs/Release Notes:** **Not available** from Homebrew core. Would require scraping GitHub/GitLab release pages for each package's tap - fragile, rate-limited, and complex to maintain.
- ✅ **Status Indicators:** **Partially available:**
  - Running/Broken/Restart Required: **Only for background services** via `brew services list`
  - For regular applications/packages: **No native status** from Homebrew. Would need to check if processes are running (app-specific and unreliable).

**Recommendation:** Implement the feasible items (Version Compare, Disk Usage, Install Path, Dependencies, Install Date). Skip Last Used and Changelogs. For Status, only show service status for applicable packages via `brew services`.