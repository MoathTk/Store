import 'package:flutter/material.dart';

class CustomerTableContainer extends StatelessWidget {
  final Widget child;

  const CustomerTableContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surface,
       // borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.3),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: colors.primary.withValues(alpha: 0.06),
        //     blurRadius: 20,
        //     offset: const Offset(0, 6),
        //   ),
        //   BoxShadow(
        //     color: colors.primary.withValues(alpha: 0.03),
        //     blurRadius: 8,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: child,
    );
  }
}
