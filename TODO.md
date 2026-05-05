# TODO

- [x] Make sure we add pagination to fetching items from our database to restrict network requests for icons. - added debounce for fetching pictures and pagination to the db
- [ ] Make sure you don't have any magic numbers or magic strings
- [x] Revisit and clean up your widgets to make sure they're clean and use view models if needed (looking at you [package_icon.dart](lib/common_widgets/package_icon.dart) )
- [x] Update Side navigation items to use new / updated assets
- [x] Rename [brew_card.dart](lib/common_widgets/brew_card.dart) to something more appropriate and maybe even move it entirely. It's a card i expect we'll use SPECIFICALLY for the TRENDING feed.
- [ ] Do a pass over all components to see if there's any performance gains you're missing
- [x] See if there's anything you can do to boost the performance of your packages view
- [ ] Look into the use of color in your app. Are we using stuff consistently?
- [x] Oprtimize loading times for home page
- [x] Look into search and filter options for the packages (i.e. why show stuff that's not supported on your operating system?)
- [x] Scrolling back to top by using the button is janky as fuck. Let's investigate that. Let's also investigate if we need that at all considering we already "scroll to top" when we change filters
- [ ] Look into the padding of the Packages view. Maybe it's worth switching to 2Xl from Xl for the horizontal padding across the screen to bring eveything in line with the trending carousel.
- [x] View behaves kind of strageny when toggling between filters. It resets the scroll position to top sometimes and sometimes it doesnt (after you've scrolled just a bit). Look into that.
- [ ] Add a more expressive loading indicator for fetching the data initially for various views.
