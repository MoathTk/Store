import 'package:flutter/material.dart';

class AppGradients extends ThemeExtension<AppGradients> {
  final Color backgroundStart;
  final Color backgroundMid;
  final Color backgroundEnd;
  final Color cardStart;
  final Color cardEnd;

  const AppGradients({
    required this.backgroundStart,
    required this.backgroundMid,
    required this.backgroundEnd,
    required this.cardStart,
    required this.cardEnd,
  });

  @override
  ThemeExtension<AppGradients> copyWith({
    Color? backgroundStart,
    Color? backgroundMid,
    Color? backgroundEnd,
    Color? cardStart,
    Color? cardEnd,
  }) {
    return AppGradients(
      backgroundStart: backgroundStart ?? this.backgroundStart,
      backgroundMid: backgroundMid ?? this.backgroundMid,
      backgroundEnd: backgroundEnd ?? this.backgroundEnd,
      cardStart: cardStart ?? this.cardStart,
      cardEnd: cardEnd ?? this.cardEnd,
    );
  }

  @override
  ThemeExtension<AppGradients> lerp(
    covariant ThemeExtension<AppGradients>? other,
    double t,
  ) {
    if (other is! AppGradients) return this;
    return AppGradients(
      backgroundStart:
          Color.lerp(backgroundStart, other.backgroundStart, t)!,
      backgroundMid: Color.lerp(backgroundMid, other.backgroundMid, t)!,
      backgroundEnd: Color.lerp(backgroundEnd, other.backgroundEnd, t)!,
      cardStart: Color.lerp(cardStart, other.cardStart, t)!,
      cardEnd: Color.lerp(cardEnd, other.cardEnd, t)!,
    );
  }

  LinearGradient get backgroundGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [backgroundStart, backgroundMid, backgroundEnd],
        stops: const [0.0, 0.5, 1.0],
      );

  LinearGradient get cardGradient => LinearGradient(
        colors: [cardStart, cardEnd],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}
