# Bartender — Project Overview

Bartender: A Flutter macOS/linux desktop application that serves as a graphical frontend for the Homebrew package manager. It allows users to browse, search, install, update, and manage Homebrew packages (formulae and casks) and taps.

## Package structure (lib/)

| Package | Role |
|---------|------|
| `core/` | Shared utilities (`shell_utils.dart`), themes, constants, extensions |
| `data/` | Repositories, shell execution wrappers (`BrewService`), data models |
| `features/` | Feature-based UI components (e.g., `packages`, `taps`, `settings`) |
| `main.dart` | Application entry point and Provider setup |

## Key Concepts

- **Desktop First:** This is a macOS desktop app. UI must adhere to macOS paradigms (density, hover states, window management).
- **Homebrew Interface:** The app does not manage packages itself; it executes `brew` CLI commands via `ShellUtils` and parses the output.
- **State Management:** Uses `provider` for dependency injection and state management.

## Do NOT use

- Mobile-only UI paradigms (like bottom sheets or mobile-style app bars) unless explicitly designed for desktop.
- Hardcoded shell execution (always use `ShellUtils`).
- External networking for package data if it can be fetched directly from the local `brew` CLI.

## Stack

Flutter, Dart, `provider`, `process_run` (or standard `Process` via `ShellUtils`).
