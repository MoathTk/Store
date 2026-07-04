import 'package:flutter/material.dart';
import '../../../../core/theme/app_gradients.dart';
import 'sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideUp;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _slideUp = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
      ),
    );
    _pulse = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToSignUp() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const SignUpScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: FadeTransition(
                opacity: _fadeIn,
                child: SlideTransition(
                  position: _slideUp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLogo(gradients, colors),
                      const SizedBox(height: 40),
                      _buildTitle(colors),
                      const SizedBox(height: 16),
                      _buildSubtitle(colors),
                      const SizedBox(height: 60),
                      _buildGoButton(colors),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(AppGradients gradients, ColorScheme colors) {
    return AnimatedBuilder(
      animation: _pulse,
      builder: (context, child) => Transform.scale(
        scale: _pulse.value,
        child: child,
      ),
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradients.cardGradient,
          boxShadow: [
            BoxShadow(
              color: colors.primary.withValues(alpha: 0.4),
              blurRadius: 50,
              spreadRadius: 8,
            ),
          ],
        ),
        child: Icon(
          Icons.store_rounded,
          size: 65,
          color: colors.onPrimary,
        ),
      ),
    );
  }

  Widget _buildTitle(ColorScheme colors) {
    return Text(
      'Store\nManagement',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: colors.onSurface,
        letterSpacing: 2,
        height: 1.2,
      ),
    );
  }

  Widget _buildSubtitle(ColorScheme colors) {
    return Text(
      'Efficiently manage your inventory,\nsales, and staff in one place.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: colors.onSurface.withValues(alpha: 0.6),
        fontWeight: FontWeight.w300,
        height: 1.5,
      ),
    );
  }

  Widget _buildGoButton(ColorScheme colors) {
    return SizedBox(
      width: 220,
      height: 56,
      child: ElevatedButton(
        onPressed: _goToSignUp,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 8,
          shadowColor: colors.primary.withValues(alpha: 0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Get Started',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                color: colors.onPrimary,
              ),
            ),
            const SizedBox(width: 10),
            Icon(Icons.arrow_forward_rounded, size: 22, color: colors.onPrimary),
          ],
        ),
      ),
    );
  }
}
