# icon_button_m3e

Expressive Material 3 icon button for Flutter — `IconButtonM3E` — with
five sizes (XS–XL), four variants (standard, filled, tonal, outlined),
round/square shapes, toggle support, and guaranteed 48×48dp tap targets
(even when visual size is 32/40).

## Highlights

- **Expressive sizes**: XS=32, S=40, M=48, L=56, XL=64 (customizable)
- **Variants**: standard, filled, tonal, outlined
- **Shapes**: round (circle) or square (rounded rect)
- **Toggle**: `isSelected` + `selectedIcon`
- **A11y**: min 48×48dp hit target; semantics label/selected state
- **Tokens**: ship `IconButtonM3ETokens` via `ThemeExtension`

## Install

```yaml
dependencies:
  icon_button_m3e:
    path: ../icon_button_m3e  # or from pub once published
```

## Quick Start

```dart
import 'package:icon_button_m3e/icon_button_m3e.dart';

IconButtonM3E(
  variant: IconButtonM3EVariant.filled,
  size: IconButtonM3ESize.m,
  icon: const Icon(Icons.mic),
  tooltip: 'Start recording',
  onPressed: () {},
);
```

### Toggle

```dart
bool isFav = false;

IconButtonM3E(
  variant: IconButtonM3EVariant.tonal,
  isSelected: isFav,
  icon: const Icon(Icons.favorite_border),
  selectedIcon: const Icon(Icons.favorite),
  tooltip: isFav ? 'Remove from favorites' : 'Add to favorites',
  onPressed: () => setState(() => isFav = !isFav),
);
```

## Theming (Tokens)

```dart
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
  extensions: const [
    IconButtonM3ETokens.fallback(), // customize by copying and adjusting
  ],
);
```

## Example

Run the example app:

```sh
cd example
flutter run
```

## License

MIT
