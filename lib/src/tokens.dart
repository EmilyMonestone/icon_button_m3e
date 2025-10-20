import 'package:flutter/material.dart';
import 'enums.dart';

@immutable
class IconButtonM3ETokens extends ThemeExtension<IconButtonM3ETokens> {
  final Map<IconButtonM3ESize, double> containerSize;
  final Map<IconButtonM3ESize, double> iconSize;
  final double squareRadius;
  final double outlineWidth;
  final double hoverOpacity;
  final double focusOpacity;
  final double pressedOpacity;
  final double draggedOpacity;

  const IconButtonM3ETokens({
    required this.containerSize,
    required this.iconSize,
    required this.squareRadius,
    required this.outlineWidth,
    required this.hoverOpacity,
    required this.focusOpacity,
    required this.pressedOpacity,
    required this.draggedOpacity,
  });

  const IconButtonM3ETokens.fallback()
      : containerSize = const {
          IconButtonM3ESize.xs: 32,
          IconButtonM3ESize.s : 40,
          IconButtonM3ESize.m : 48,
          IconButtonM3ESize.l : 56,
          IconButtonM3ESize.xl: 64,
        },
        iconSize = const {
          IconButtonM3ESize.xs: 18,
          IconButtonM3ESize.s : 20,
          IconButtonM3ESize.m : 24,
          IconButtonM3ESize.l : 28,
          IconButtonM3ESize.xl: 32,
        },
        squareRadius = 12,
        outlineWidth = 1,
        hoverOpacity = 0.08,
        focusOpacity = 0.10,
        pressedOpacity = 0.10,
        draggedOpacity = 0.16;

  @override
  IconButtonM3ETokens copyWith({
    Map<IconButtonM3ESize, double>? containerSize,
    Map<IconButtonM3ESize, double>? iconSize,
    double? squareRadius,
    double? outlineWidth,
    double? hoverOpacity,
    double? focusOpacity,
    double? pressedOpacity,
    double? draggedOpacity,
  }) {
    return IconButtonM3ETokens(
      containerSize: containerSize ?? this.containerSize,
      iconSize: iconSize ?? this.iconSize,
      squareRadius: squareRadius ?? this.squareRadius,
      outlineWidth: outlineWidth ?? this.outlineWidth,
      hoverOpacity: hoverOpacity ?? this.hoverOpacity,
      focusOpacity: focusOpacity ?? this.focusOpacity,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      draggedOpacity: draggedOpacity ?? this.draggedOpacity,
    );
  }

  @override
  IconButtonM3ETokens lerp(ThemeExtension<IconButtonM3ETokens>? other, double t) {
    if (other is! IconButtonM3ETokens) return this;
    // For simplicity, return this; token maps don't lerp meaningfully here.
    return this;
  }
}
