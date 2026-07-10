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
- [x] Revisit Taps and see if we can make the card a bit more expressive and add a bit more content to it. - ADD: Disk size (git repo size), split counts (formulae vs casks), git
- [x] Consider doing somethign more suggestive for the "precompiled" description. - USE ICONS: 📦 Box + "Ready-to-run" for precompiled, 🔨 Hammer + "Build from source" for source; add tooltips for detailsbranch (if not default); REMOVE individual "force sync" button (use global sync instead)
- [x] Make sure you don't have any magic numbers or magic strings
- [x] !!! Test Trust / Untrust functionaltiy across the app. -> You're doing some background work with no UI indicator of it. We need to fix that. Repro steps are just "trust" a tap. You'll see everything according to plan, except that once the "trust" confirmation dialog is "confirmed" you don't offer any visual feedback of stuff happening.
- [x] Do another sweep and move strings to app_strings.dart
- [x] Cleanup text styles -> We need to clean up Monospace and FiraCode.
- [x] Some build methods are doing a bit of heavy lifting. We should consider moving that to a separate
- [x] clean up how we use repos and shit around here. you're using homebrew_repository AND package_repository. What's the difference between the two if you're doing DB writes and running console commands?
- [x] Consider renaming "library" to "Installed".
- [x] Allow for selection of "trending" period (and make sure you support the requests as well)
- [x] Re-style the trending period selectors cause they look kind of wack. Probably worth looking into the other filter buttons as well. Maybe make 10 pages of 4 packages each as well. Just a thought.
- [x] Do a pass over all components to see if there's any performance gains you're missing
- [x] Cleanup the settings screen: widget cleanup, performance optimization audit, consistency of widgets used, colors, fonts and styles (which are not correctly called right now)
- [x] Reexamine the "browse" and autoresolved path flow. We should not need a "browse" button, but we CAN refine the flow with an autoresolve button and some error state or warning or whatever to polish the UI/UX
- [x] Look at the leading icons for the title in the bento cards for settings view. Do they make sense? Is it worth looking for better alternatives?
- [ ] Add a more expressive loading indicator for fetching the data initially for various views.
- [ ] Think about if we need to change the background of filters and search (restyle it maybe)
- [ ] Look into the use of color in your app. Are we using stuff consistently?
- [ ] Look into the padding of the Packages view. Maybe it's worth switching to 2Xl from Xl for the horizontal padding across the screen to bring eveything in line with the trending carousel.
- [ ] You should also probably add some new filters for precompiled or deprecated packages
      substate or something to clean them up
- [ ] Investigate and add Sentry for crashlytics and error tracking (macOS/Linux compatible)
- [ ] Investigate and add PostHog for product analytics and metrics (macOS/Linux compatible)
- [ ] Reexamine supported "Library" operations (see if you can maybe add more or somethings)

# Issues:

- [x] Terminal window clips the edges, so we need to address that
- [x] when minimising the termial, we're getting some overflow errors
- [ ] spacer between item queue doesn't look particularly good. we can do better there. Also, we need to consider very large queues, as an edge case
- [x] filter by taps isn't working correctly. Selecring a custom tap AND core will not show the contents of both taps. it will only show the contents of the first selected tap
- [ ] packages from taps are not aggregated into the "packages_view" page
- [ ] trusted packages sometimes do not show up because of platform constrants and we need to address that
- [ ] Reexamine the Last Synced item in the library pane because i don't really think it brings any actual value. I think we're good with just using the Installation date. Maybe replace it with a "last updated" or something along those lines.
- [ ] Information on tap packages does not show up in the inspector pane.
