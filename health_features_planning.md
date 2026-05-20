# Homebrew Health Features Planning

## Overview
This document captures the strategy for implementing system and package health checks in Bartender, using Homebrew's built-in tools. It covers a dual-pronged approach targeting both global health tracking and granular, package-level actions.

---

## 1. Available Tools & Metrics

### Available Updates (Outdated Packages)
*   **Command:** `brew outdated --json`
*   **Concept:** Identify installed formulas/casks that have newer versions available.

### Junk Removal & Disk Space (Cleanup)
*   **Commands:** `brew cleanup --dry-run` and `brew autoremove --dry-run`
*   **Concept:** Identify reclaimable disk space and orphaned dependencies (installed automatically but no longer needed).

### System Environment Health (Brew Doctor)
*   **Command:** `brew doctor`
*   **Concept:** Diagnostic tool checking for permission errors, unlinked binaries, and missing command-line tools. Returns `0` if healthy, `1` if there are issues.

### Broken or Missing Dependencies
*   **Command:** `brew missing`
*   **Concept:** Returns a list of packages missing required dependencies (often caused by manual deletions or force-uninstalls).

### Deprecations and Abandonware
*   **Command:** `brew info --installed --json=v2`
*   **Concept:** JSON output includes `deprecated` and `disabled` boolean flags, plus reasons and dates, useful for flagging packages no longer receiving security updates.

---

## 2. Architecture: The Two-Pronged Approach

To efficiently support global summaries and granular actions without hanging the UI on slow CLI calls, a background sync architecture is required:

### The Data Sync Flow (The "Glue")
1. **Background Sync:** On app start (or manual refresh), `BrewService` runs `brew outdated`, `brew info`, and `brew missing` in the background.
2. **Local DB Update:** Parse the responses and update the local `DatabaseInterface` (appending flags like `isOutdated`, `latestVersion`, `isDeprecated` to local package records).
3. **Global UI:** Sums up the database flags to render aggregate metrics.
4. **Package UI:** The `InspectorPane` reads the cached package record flags and immediately displays relevant granular actions without re-fetching.

---

### Prong 1: Global Health (`GlobalHealthStatusWidget`)
A high-level dashboard ribbon listening to a global `SystemHealthState`.

*   **Global Updates:** "14 packages have updates available." Action: "Update All" (`brew upgrade`).
*   **Global Cleanup:** "1.2 GB can be freed." Action: "Run Cleanup" (`brew cleanup`).
*   **Global Autoremove:** "5 unused dependencies found." Action: "Remove" (`brew autoremove`).
*   **Global Doctor Warnings:** "System Check: 2 Warnings." Action: "View Issues" (opens a dialog).

#### Parsing `brew doctor`
Because `brew doctor` outputs raw text (not JSON), it requires string parsing in Dart:
1. Strip the standard Homebrew boilerplate text at the top.
2. Split the remaining text by `Warning: ` or `Error: `.
3. Map these chunks into structured objects (e.g., `class DoctorIssue { severity, title, details }`).
4. Render as a clean list of expandable cards in a UI modal.

---

### Prong 2: Granular Package Health (`InspectorPane`)
Specific actions available when a user selects a package, reacting to the locally synced state.

*   **Version Status:** 
    *   *Condition:* `package.isOutdated == true`
    *   *UI:* "Installed: v1.2.0 | Available: v1.3.0" with an **"Update"** button (`brew upgrade <package>`).
*   **Deprecation / Abandonware Alerts:**
    *   *Condition:* `package.isDeprecated == true` or `package.isDisabled == true`
    *   *UI:* Yellow/red warning banner at the top of the Inspector detailing the deprecation reason.
*   **Broken Dependencies:**
    *   *Condition:* Package exists in `brew missing` list.
    *   *UI:* Alert block listing missing items, with a **"Fix Dependencies"** button (`brew install <missing_deps>`).
*   **App Reset / Deep Clean (Casks):**
    *   *UI:* Offer a zap action (`brew uninstall --zap <cask>`) to clear preferences and cached files.

---

## 3. Implementation Checklist
1. **Models:** Create `HealthState`, `DoctorIssue`, and append health fields to the `Package` model.
2. **Brew Service Methods:** Implement `getOutdatedPackages()`, `getMissingDependencies()`, and `getDoctorIssues()` (with the custom string parser).
3. **UI Components:** Build the `HealthDashboard` modal/dropdown for the global view, and dynamic warning banners inside the `InspectorPane`.