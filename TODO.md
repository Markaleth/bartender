# TODO

- [ ] Make sure we add pagination to fetching items from our database to restrict network requests for icons.
- [ ] Make sure you don't have any magic numbers or magic strings
- [x] Revisit and clean up your widgets to make sure they're clean and use view models if needed (looking at you [package_icon.dart](lib/common_widgets/package_icon.dart) )
- [x] Update Side navigation items to use new / updated assets
- [x] Rename [brew_card.dart](lib/common_widgets/brew_card.dart) to something more appropriate and maybe even move it entirely. It's a card i expect we'll use SPECIFICALLY for the TRENDING feed.
- [ ] Do a pass over all components to see if there's any performance gains you're missing
- [ ] See if there's anything you can do to boost the performance of your packages view
- [ ] Look into the use of color in your app. Are we using stuff ocnsistently?
