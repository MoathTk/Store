import 'package:flutter/material.dart';

class ProductTableContainer extends StatelessWidget {
  final Widget child;

  const ProductTableContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: child,
    );
  }
}
