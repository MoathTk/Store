import 'package:flutter/material.dart';

class CustomerAvatar extends StatelessWidget {
  final String fullName;
  final double radius;

  const CustomerAvatar({super.key, required this.fullName, this.radius = 18});

  String get _initials {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts.last[0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return CircleAvatar(
      radius: radius,
      backgroundColor: colors.primaryContainer,
      child: Text(
        _initials,
        style: TextStyle(
          fontSize: radius * 0.8,
          fontWeight: FontWeight.w600,
          color: colors.onPrimaryContainer,
        ),
      ),
    );
  }
}
