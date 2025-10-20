## 0.1.1

Refactor to centralized tokens and new sizing API.

- Centralize all numeric tokens in `lib/src/tokens.dart` using a `library + part` structure.
  - `lib/src/enums.dart` is now the library; `tokens.dart` is a `part` with only numbers/constants.
  - Adds icon glyph sizes, visual and target size maps, per-size radii, and motion tokens.
- New enums and names to match spec:
  - `M3EIconButtonSize { xs, sm, md, lg, xl }`
  - `M3EIconButtonWidth { defaultWidth, narrow, wide }`
  - `M3EIconButtonShapeVariant { round, square }`
  - Keep `IconButtonM3EVariant` (standard, filled, tonal, outlined).
- Behavior updates:
  - Visual vs target sizing: XS/SM enforce 48×48 min target; others match visual.
  - Shape morphing: pressed state uses shared pressed radius; toggle can flip round/square when selected.
- Example app and tests updated to new API.

BREAKING CHANGES:
- Removed `IconButtonM3ETokens` ThemeExtension; tokens are static in `M3EIconButtonTokens`.
- Replaced `IconButtonM3ESize` with `M3EIconButtonSize` and `IconButtonM3EWidth` with `M3EIconButtonWidth`.
- Replaced `IconButtonM3EShape` with `M3EIconButtonShapeVariant`.

## 0.1.0

- Initial release: IconButtonM3E widget (Material 3 Expressive)
- ThemeExtension tokens for size, icon size, radii, and state opacities
- Example app demonstrating variants, sizes, shapes, and toggle
- Basic tests for semantics and hit target size
