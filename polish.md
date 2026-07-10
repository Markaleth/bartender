### 2. Custom Taps Excluded from General Package Listing/Search

The general package listing does not include the packages of custom taps. When a user adds a custom tap (like MongoDB), they cannot search for its packages in the general "packages" listing directly. The search only works if the user first explicitly filters packages by that specific tap. Because custom taps usually do not contain many packages, requiring an explicit filter makes the search feature significantly less useful and discoverable.

### 3. Silent Empty States for Unsupported Taps

Users can add custom taps that do not support their operating system, but when browsing these taps, no results are shown and the view appears completely empty. This is poor UI/UX because it silently hides the packages without providing any context. The system should still show the contents of the tap, but clearly mark those packages as "unavailable for your platform" so the user understands why they cannot be installed.
