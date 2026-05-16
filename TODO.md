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
- [ ] Add a more expressive loading indicator for fetching the data initially for various views.
- [ ] Allow for selection of "trending" period (and make sure you support the requests as well)
- [ ] Think about if we need to change the background of filters and search (restyle it maybe)
- [ ] Look into the use of color in your app. Are we using stuff consistently?
- [ ] Do a pass over all components to see if there's any performance gains you're missing
- [ ] Make sure you don't have any magic numbers or magic strings
- [ ] Look into the padding of the Packages view. Maybe it's worth switching to 2Xl from Xl for the horizontal padding across the screen to bring eveything in line with the trending carousel.
- [ ] Consider renaming "library" to "Installed".
- [ ] Think about if the "updates" tab is actually necessary
- [ ] Add tap support. 


# Issues:

- [ ] Terminal close icon is not very suggestive (should be an x or something instantly recognizable)
- [ ] when minimising the termial, we're getting some overflow errors
- [ ] text in terminal look blurry. play with the styling to improve that
- [ ] spacer between item queue doesn't look particularly good. we can do better there. Also, we need to consider very large queues, as an edge case
- [ ] Button label doesn't update for [package_list_item.dart](lib/features/packages/widgets/package_list_item.dart). need to look into that

# Supported information for "Library"

- [ ] Version Comparison (Current vs. Latest)
- [ ] Disk Usage (Package size + cached data)
- [ ] Installation Path (Where it lives on the system)
- [ ] Changelogs/Release Notes (Inline or modal before update)
- [ ] Dependencies (Requires/Required By)
- [ ] Last Used / Installation Date
- [ ] Status Indicators (Running, broken, restart required)

# Supported actions for "Library"

- [ ] Launch / Open (For executables/CLI tools)
- [ ] Downgrade / Rollback (Install previous version)
- [ ] Pin / Lock Version (Exclude from Update All)
- [ ] Verify / Repair (Check checksum/re-download)
- [ ] Open Directory (Open OS file explorer to install dir)
- [ ] Clear Cache / Reset (Wipe local config/cache)

# Homebrew Taps (Summary)

## What Taps Are
Taps are third-party catalogs or repositories of software (like kegs of specific drinks for a bartender). Homebrew comes with default taps (`homebrew/core`, `homebrew/cask`), but anyone can host their own tap on GitHub (e.g., `mongodb/brew`, `hashicorp/tap`). When a tap is added, the entire catalog inside that tap becomes available to the local Homebrew CLI. There is no central registry of all available taps in the world.

## Current Support Level
- **API Limitation:** The online Homebrew API (`formulae.brew.sh/api/...`) we currently use only knows about the official default taps. It does not index third-party taps.
- **Local CLI:** The local `brew` command (`brew info --installed --json=v2`) successfully detects and lists third-party packages installed on the user's machine.
- **Models:** Our data models (`FormulaModel` and `CaskModel`) already support and parse the `tap` field correctly (e.g., `"tap": "1password/tap"`).

## Required Changes
- **`brew_service.dart`:** Add a `tapRepo(String input, {String? customUrl})` method to execute `brew tap <name> [url]`. Add another method to fetch info about a specific tap using `brew tap-info --json=v1 <tap_name>`.
- **Models:** Create a new model (e.g., `TapModel`) to parse the JSON response from `brew tap-info`, which contains lists of `formula_names` and `cask_tokens` available in that tap.

## UI Options & Recommendations
To let users add new taps, we need to handle the standard `user/repo` format and the rare edge case of full Git URLs.
- **Option 1: Two Input Fields (Name and URL)**
  - *Why:* Explicitly covers the 1% of non-GitHub or private enterprise taps.
  - *Drawback:* Clunky UX for the 99% of users just pasting `user/repo`.
- **Option 2: Single "Smart Input" Field (Recommended)**
  - *Why:* Ask the user for a "Tap Name or Git URL". If they type a standard `user/repo` (e.g., `mongodb/brew`), we just run `brew tap mongodb/brew`. If they paste a full URL (e.g., `https://gitlab.com/...`), our logic parses the string to extract a valid name, and runs `brew tap <extracted_name> <full_url>`. This keeps the UI completely clean while dynamically supporting all use cases.
