import 'package:flutter/material.dart';
import '../../../../core/theme/app_gradients.dart';

class AnimatedLogo extends StatelessWidget {
  final Animation<double> animation;
  final double size;
  final bool pulse;

  const AnimatedLogo({
    super.key,
    required this.animation,
    this.size = 110,
    this.pulse = true,
  });

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final colors = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Transform.scale(
        scale: pulse ? 0.95 + (animation.value * 0.1) : animation.value,
        child: child,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradients.cardGradient,
          boxShadow: [
            BoxShadow(
              color: colors.primary.withValues(alpha: 0.4),
              blurRadius: size * 0.38,
              spreadRadius: size * 0.045,
            ),
          ],
        ),
        child: Icon(
          Icons.store_rounded,
          size: size * 0.5,
          color: colors.onPrimary,
        ),
      ),
    );
  }
}
