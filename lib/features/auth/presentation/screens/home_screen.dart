import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../core/theme/app_gradients.dart';
import '../providers/auth_provider.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: gradients.backgroundGradient),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: gradients.cardGradient,
                      boxShadow: [
                        BoxShadow(
                          color: colors.primary.withValues(alpha: 0.4),
                          blurRadius: 40,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.store_rounded,
                      size: 50,
                      color: colors.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Hello, $username',
                    style: TextStyle(
                      fontSize: 20,
                      color: colors.onSurface.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<AuthProvider>().reset();
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const LoginScreen(),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                            transitionDuration:
                                const Duration(milliseconds: 600),
                          ),
                        );
                      },
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            colors.onSurface.withValues(alpha: 0.1),
                        foregroundColor: colors.onSurface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  IconButton(
                    onPressed: () => context.read<ThemeProvider>().toggle(),
                    icon: Icon(
                      context.read<ThemeProvider>().isDark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      color: colors.onSurface.withValues(alpha: 0.6),
                    ),
                    tooltip: 'Toggle theme',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
