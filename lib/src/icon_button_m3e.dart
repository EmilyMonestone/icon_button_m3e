import 'package:flutter/material.dart';

import 'enums.dart';
import 'tokens.dart';

/// Material 3 Expressive Icon Button
///
/// - Sizes: XS (32), S (40), M (48), L (56), XL (64) [visual]
/// - Tap target is always >= 48x48
/// - Variants: standard, filled, tonal, outlined
/// - Shapes: round (circle) or square (rounded rect)
/// - Toggle: [isSelected] + [selectedIcon]
class IconButtonM3E extends StatelessWidget {
  const IconButtonM3E({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.semanticLabel,
    this.variant = IconButtonM3EVariant.standard,
    this.size = IconButtonM3ESize.s,
    this.shape = IconButtonM3EShape.round,
    this.isSelected,
    this.selectedIcon,
    this.enableFeedback,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final String? semanticLabel;
  final IconButtonM3EVariant variant;
  final IconButtonM3ESize size;
  final IconButtonM3EShape shape;
  final bool? isSelected;
  final Widget? selectedIcon;
  final bool? enableFeedback;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final tokens = Theme.of(context).extension<IconButtonM3ETokens>() ??
        const IconButtonM3ETokens.fallback();

    final double visual = tokens.containerSize[size]!;
    final double iconPx = tokens.iconSize[size]!;

    // Accessibility: ensure at least 48x48 tap target.
    const double kMinHit = 48.0;
    final double hit = visual >= kMinHit ? visual : kMinHit;

    // Colors per variant (selected tint for standard).
    Color bg;
    Color fg;
    Color? outline;
    switch (variant) {
      case IconButtonM3EVariant.standard:
        bg = Colors.transparent;
        fg = (isSelected ?? false) ? scheme.primary : scheme.onSurfaceVariant;
        outline = null;
        break;
      case IconButtonM3EVariant.filled:
        bg = scheme.primary;
        fg = scheme.onPrimary;
        outline = null;
        break;
      case IconButtonM3EVariant.tonal:
        bg = scheme.secondaryContainer;
        fg = scheme.onSecondaryContainer;
        outline = null;
        break;
      case IconButtonM3EVariant.outlined:
        bg = Colors.transparent;
        fg = scheme.primary;
        outline = scheme.outline;
        break;
    }

    final OutlinedBorder shapeBorder = switch (shape) {
      IconButtonM3EShape.round => const CircleBorder(),
      IconButtonM3EShape.square => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(tokens.squareRadius)),
    };

    Color overlayFor(Set<WidgetState> states) {
      if (states.contains(WidgetState.dragged)) {
        return fg.withValues(alpha: tokens.draggedOpacity);
      }
      if (states.contains(WidgetState.pressed)) {
        return fg.withValues(alpha: tokens.pressedOpacity);
      }
      if (states.contains(WidgetState.focused)) {
        return fg.withValues(alpha: tokens.focusOpacity);
      }
      if (states.contains(WidgetState.hovered)) {
        return fg.withValues(alpha: tokens.hoverOpacity);
      }
      return Colors.transparent;
    }

    // Build the inner IconButton with a fixed (hit) size. Visual container drawn separately if needed.
    Widget core = IconButton(
      onPressed: onPressed,
      isSelected: isSelected,
      selectedIcon: selectedIcon,
      icon: IconTheme.merge(
        data: IconThemeData(size: iconPx, color: fg),
        child:
            (isSelected == true && selectedIcon != null) ? selectedIcon! : icon,
      ),
      tooltip: tooltip,
      enableFeedback: enableFeedback,
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(Size.square(hit)),
        // Keep background transparent here; we draw the visual container below when needed.
        backgroundColor:
            WidgetStateProperty.resolveWith((_) => Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((_) => fg),
        overlayColor: WidgetStateProperty.resolveWith(overlayFor),
        shape: WidgetStateProperty.all(shapeBorder),
        side: WidgetStateProperty.resolveWith((_) => outline != null
            ? BorderSide(color: outline, width: tokens.outlineWidth)
            : BorderSide.none),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        visualDensity: VisualDensity.standard,
      ),
    );

    // Draw a visual container for filled/tonal/outlined or when you want a visible background/border
    final bool needsVisualContainer =
        variant != IconButtonM3EVariant.standard ||
            outline != null ||
            visual < hit;
    if (needsVisualContainer) {
      core = Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: visual,
            height: visual,
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: shapeBorder.copyWith(
                  side: outline != null
                      ? BorderSide(width: tokens.outlineWidth, color: outline)
                      : BorderSide.none,
                ),
                color: (variant == IconButtonM3EVariant.standard ||
                        outline != null)
                    ? Colors.transparent
                    : bg,
              ),
            ),
          ),
          core,
        ],
      );
    }

    final semanticsText = semanticLabel ?? tooltip;
    return Semantics(
      button: true,
      selected: isSelected ?? false,
      label: semanticsText,
      child: core,
    );
  }
}
