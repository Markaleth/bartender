---
paths:
  - "lib/features/**/widgets/**"
  - "lib/features/**/views/**"
  - "lib/common_widgets/**"
---

# UI Patterns

## Desktop First
Bartender is a macOS/linux application.
- Prioritize high information density over touch-friendly spaciousness.
- Use hover states for interactive elements.
- Consider split panes or sidebars instead of bottom navigation or deep push/pop navigation stacks.
- Mouse and keyboard interactions (like scrolling behavior and shortcuts) should feel native.

## Component Structure
- **Reuse first:** Always prefer using existing reusable components (e.g., from `lib/common_widgets/` or shared feature folders) before creating new ones. Search the codebase for similar UI elements before building from scratch.
- Keep Widgets small and focused.
- Break large `build` methods into separate Widget classes, NOT helper methods returning `Widget`.
- Pass state (or use `context.watch`) deeply only when necessary to avoid rebuilding entire large widget trees.

## Styling, Colors & Icons
- Do NOT hardcode colors or text styles.
- ALWAYS use the `BartenderContext` extension methods (from `lib/theme/bartender_context.dart`) for typography and layout dimensions instead of the verbose `Theme.of(context).textTheme` or `MediaQuery` syntax.
  ```dart
  // Correct Example
  Text('Label', style: context.bodyM);
  Text('Code', style: context.monoM);
  Container(width: context.windowWidth);
  
  // Incorrect Example
  Text('Label', style: Theme.of(context).textTheme.bodyMedium);
  ```
- **Colors**: Strictly use the predefined palette in `lib/core/constants/app_colors.dart` (e.g., `AppColors.primary`, `AppColors.textSecondary`) as much as possible. Avoid introducing new hex codes or raw `Color()` constructors at the widget level.
- **Icons**: Always prefer SVG assets defined in `lib/core/constants/app_icons.dart` rendered via `IconWidget` (from `lib/common_widgets/icon_widget.dart`). You may fall back to standard Material icons (`Icons.*`) ONLY if no suitable SVG asset exists in our library. If you do fall back to a Material icon, you MUST explicitly point it out in your response and warn that a Material icon was used instead of an SVG asset.
- **Strings**: Never hardcode user-facing strings directly in UI widgets. Always define them as constants in `lib/core/constants/app_strings.dart` and reference them from there.
- Use standard spacing constants if defined in `core/constants/` or `core/theme/`.

## Dialogs & Modals
- Prefer in-place UI updates or side panels over blocking modal dialogs where possible.
- If a modal is needed, ensure it is properly sized for desktop and can be dismissed via the Escape key.
