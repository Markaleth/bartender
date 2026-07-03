# Performance Audit Report

This document outlines the performance audit of the application, focusing heavily on the UI, state management scoping, reducing unnecessary re-renders, and concurrent execution bottlenecks.

## 1. Queue Logging Re-renders (Massive Redraws)
- **Offending Widgets/Classes:** `TerminalDrawerOverlay`, `ExpandedWidget`, `LogListViewer`, `QueueViewModel`
- **The Offense:** `QueueViewModel` receives streaming logs via `_listenToCommandOutput` and appends them to an `OperationTask` within the global `QueueState`. Because `TerminalDrawerOverlay` uses `BaseView` (a global `Consumer`), every new line of log output triggers a complete rebuild of the entire terminal drawer, visualizer, and log list.
- **Impact:** Extremely high CPU usage and UI stuttering during package installations or updates, as streams can emit hundreds of lines per second, forcing hundreds of widget tree rebuilds per second.
- **Weight:** 95
- **Fix Suggestion:** Decouple logs from the global `QueueState`. Use a local `ValueNotifier<List<String>>` or expose a `Stream<String>` directly to a `StreamBuilder` inside `LogListViewer`. Additionally, wrap the `AnimatedContainer` in `TerminalDrawerOverlay` with a `RepaintBoundary` so its constant scrolling/animating doesn't invalidate the rest of the application's paint layers.

## 2. Un-debounced Search Queries (Event Spamming)
- **Offending Widgets/Classes:** `PackagesViewModel`, `PackageFilters`
- **The Offense:** The `TextField` in `PackageFilters` triggers `PackagesViewModel.setSearchQuery` on every keystroke. This method immediately calls `emitState` and `_refreshListings` without any debouncing.
- **Impact:** Typing quickly forces the entire `PackagesView` (including the heavy `TrendingPackagesCarousel` and all visible `PackageListItem`s) to rebuild on every keystroke. It also spams the SQLite database with concurrent queries, causing the UI to hang.
- **Weight:** 90
- **Fix Suggestion:** Implement a debounce timer (e.g., 300-500ms) inside `PackagesViewModel.setSearchQuery`. Only emit the new search query state and call `_refreshListings` after the user has paused typing.

## 3. Package Action Buttons Selector Leak
- **Offending Widgets/Classes:** `_PackageActionButton` (in `package_list_item.dart`), `_CarouselPage` (in `trending_packages_carousel.dart`)
- **The Offense:** These widgets use `context.select<QueueViewModel, OperationTask?>` to find the active queue task for their respective package. Because `OperationTask` stores the `logs` array (which changes constantly), the equality check fails on every log tick. 
- **Impact:** All visible buttons and trending carousels for the actively installing package rebuild on every log emission, even though their visual state (which only depends on `OperationStatus`) hasn't changed.
- **Weight:** 85
- **Fix Suggestion:** Scope the selector to only extract the `status` enum property. For example: 
  `context.select<QueueViewModel, OperationStatus?>((vm) => vm.state.tasks.where((t) => t.packageId == id).lastOrNull?.status)`

## 4. Overbroad State Listening in Dual-Pane Library
- **Offending Widgets/Classes:** `ExplorerPane`, `InspectorPane` (in `library_view.dart`)
- **The Offense:** Both panes call `context.watch<LibraryViewModel>()`. When a user expands a tap folder or selects a package in the explorer, `LibraryState` emits a change. Because both panes use `watch`, *both* completely rebuild.
- **Impact:** Selecting a package forces a redraw of the entire file tree in the `ExplorerPane` and all its nested collapsible slivers, defeating the purpose of the dual-pane architecture.
- **Weight:** 80
- **Fix Suggestion:** Refactor to use `context.select`. `ExplorerPane` should only select `state.uiSections` and `state.isLoading`. `InspectorPane` should only select `state.inspectorState`. Additionally, wrap both panes in a `RepaintBoundary` to isolate their independent scrolling contexts.

## 5. Global State Used for Local Widget Properties
- **Offending Widgets/Classes:** `PackagesViewModel`, `PackagesView`
- **The Offense:** `PackagesState` contains `expandedPackageId`. When a user taps to expand a package item, it updates the global state via `togglePackageExpansion`, forcing the entire `PackagesView` (`CustomScrollView`) to rebuild.
- **Impact:** Redrawing everything (filters, header, trending packages, and all list items) just to run a size animation on a single card.
- **Weight:** 75
- **Fix Suggestion:** Remove `expandedPackageId` from `PackagesState`. Use a `StatefulWidget` or a local `ValueNotifier<bool>` directly inside `PackageListItem` to handle expansion state locally.

## 6. Grid Rebuilding on Tap Sync
- **Offending Widgets/Classes:** `TapsView`
- **The Offense:** `TapsView` uses `BaseView` which rebuilds the whole `Scaffold` and `GridView.builder` whenever `state.syncingTap` changes.
- **Impact:** The entire grid of tap cards rebuilds multiple times during a sync operation, even for tap cards that are not currently syncing.
- **Weight:** 60
- **Fix Suggestion:** Use scoped state management. The main view should only build once. Use `Selector` specifically for the `_HeaderWidget` and pass only the specific tap's syncing state to the individual `TapCard` via its own `Selector` rather than rebuilding the entire `GridView`.
