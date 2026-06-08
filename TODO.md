# TODO

- [x] Make sure we add pagination to fetching items from our database to restrict network requests for icons. - added debounce for fetching pictures and pagination to the db
- [x] Revisit and clean up your widgets to make sure they're clean and use view models if needed (looking at you [package_icon.dart](lib/common_widgets/package_icon.dart) )
- [x] Update Side navigation items to use new / updated assets
- [x] Rename [brew_card.dart](lib/common_widgets/brew_card.dart) to something more appropriate and maybe even move it entirely. It's a card i expect we'll use SPECIFICALLY for the TRENDING feed.
- [x] See if there's anything you can do to boost the performance of your packages view
- [x] Oprtimize loading times for home page
- [x] Look into search and filter options for the packages (i.e. why show stuff that's not supported on your operating system?)
- [x] Scrolling back to top by using the button is janky as fuck. Let's investigate that. Let's also investigate if we need that at all considering we already "scroll to top" when we change filters
- [x] View behaves kind of strageny when toggling between filters. It resets the scroll position to top sometimes and sometimes it doesnt (after you've scrolled just a bit). Look into that.
- [x] We should do all our setup when the app is initialized, not when the viewModel is initialized.
- [x] See about improving performance because we expect to have potentially long lists of items there so just using columns might not work
- [x] Add animations to expanding and collapsing folders in the "explorer" pane
- [x] Add animation to item selection in the library explorer pannel
- [x] Add tap support.
- [x] Add "deprecated" tag or UI element to packages (in library or packages) for "at-a-glance" information
- [x] Think about if the "updates" tab is actually necessary
- [x] Update system health descriptions icons and components overall. Especially the dialog.
- [x] State is not updated once you take actions from the "global health" dialog. You need to hot reload to make the changes propagate.
- [x] Add loading indicators to the buttons. You que up stuff after you do an install, like a sync and you need to disable the buttons with a "loading" state.
- [x] Replace buttons in app with the new ButtonWidget variants.
- [ ] Add a more expressive loading indicator for fetching the data initially for various views.
- [ ] Allow for selection of "trending" period (and make sure you support the requests as well)
- [ ] Think about if we need to change the background of filters and search (restyle it maybe)
- [ ] Look into the use of color in your app. Are we using stuff consistently?
- [ ] Do a pass over all components to see if there's any performance gains you're missing
- [ ] Make sure you don't have any magic numbers or magic strings
- [ ] Look into the padding of the Packages view. Maybe it's worth switching to 2Xl from Xl for the horizontal padding across the screen to bring eveything in line with the trending carousel.
- [ ] Consider renaming "library" to "Installed".
- [ ] You should also probably add some new filters for precompiled or deprecated packages
- [x] Consider doing somethign more suggestive for the "precompiled" description. - USE ICONS: 📦 Box + "Ready-to-run" for precompiled, 🔨 Hammer + "Build from source" for source; add tooltips for details
- [ ] Reexamine supported "Library" operations (see if you can maybe add more or something)
- [ ] Cleanup text styles -> We need to clean up Monospace and FiraCode.
- [x] Revisit Taps and see if we can make the card a bit more expressive and add a bit more content to it. - ADD: Disk size (git repo size), split counts (formulae vs casks), git branch (if not default); REMOVE individual "force sync" button (use global sync instead)

# Issues:

- [ ] Terminal window clips the edges, so we need to address that
- [x] Terminal close icon is not very suggestive (should be an x or something instantly recognizable)
- [ ] when minimising the termial, we're getting some overflow errors
- [x] text in terminal look blurry. play with the styling to improve that
- [ ] spacer between item queue doesn't look particularly good. we can do better there. Also, we need to consider very large queues, as an edge case
- [ ] filter by casks isn't working correctly. Selecring a custom tap AND core will not show the contents of both taps. it will only show the contents of the first selected tap
- [ ] Having an existing filter in place for a tap, going to the taps screen and browsing the same tap again removes the tap filter in the packages view
- [ ] Exception: Failed to sync taps: Broken Pipe gets thrown on and off when the app starts, or when forcing a tap sync.
- [ ] Reexamine the Last Synced item in the library pane because i don't really think it brings any actual value. I think we're good with just using the Installation date. Maybe replace it with a "last updated" or something along those lines.

# Supported information for "Library"too

- [x] Version Comparison (Current vs. Latest) - Available via `brew outdated`/`brew info --json`
- [x] Disk Usage (Package size + cached data) - Available via `brew info --json` (installed_size)
- [x] Installation Path (Where it lives on the system) - Available via `brew --prefix`
- [ ] Changelogs/Release Notes (Inline or modal before update) - Not available from Homebrew; requires external API
- [x] Dependencies (Requires/Required By) - Available via `brew deps`/`brew info --json`
- [~] Last Used / Installation Date - Installation Date: YES (`brew info --json`); Last Used: NO (not tracked by Homebrew)
- [~] Status Indicators (Running, broken, restart required) - Only for background services via `brew services list`; not available for regular packages

# Supported actions for "Library"

- [x] Launch / Open (For executables/CLI tools) - KEEP for Casks only (no GUI for CLI formulae)
- [ ] Downgrade / Rollback (Install previous version) - REMOVE: Homebrew removed `brew switch`; complex to implement
- [x] Pin / Lock Version (Exclude from Update All) - KEEP: `brew pin <package>` works natively
- [~] Verify / Repair (Check checksum/re-download) - CHANGE to "Reinstall": `brew reinstall <package>` redownloads and reinstalls
- [x] Open Directory (Open OS file explorer to install dir) - KEEP: Very useful with `open $(brew --prefix <package>)`
- [ ] Clear Cache / Reset (Wipe local config/cache) - REMOVE: Use global System Health cleanup instead
