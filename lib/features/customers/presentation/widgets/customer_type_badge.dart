import 'package:flutter/material.dart';
import 'package:store_management/generated/l10n.dart';
import '../../domain/entities/customer_type.dart';

class CustomerTypeBadge extends StatelessWidget {
  final CustomerType type;

  const CustomerTypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;

    final (Color bg, Color fg, String label) = switch (type) {
      CustomerType.normal => (
        colors.tertiaryContainer,
        colors.onTertiaryContainer,
        s.customersTypeNormal,
      ),
      CustomerType.provider => (
        colors.secondaryContainer,
        colors.onSecondaryContainer,
        s.customersTypeProvider,
      ),
      CustomerType.providerAndCustomer => (
        colors.primaryContainer,
        colors.onPrimaryContainer,
        s.customersTypeProviderAndCustomer,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }
}
