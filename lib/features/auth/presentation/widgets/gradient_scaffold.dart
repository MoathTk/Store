import 'package:flutter/material.dart';
import '../../../../core/theme/app_gradients.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;

  const GradientScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: gradients.backgroundGradient),
        child: SafeArea(child: Center(child: child)),
      ),
    );
  }
}
