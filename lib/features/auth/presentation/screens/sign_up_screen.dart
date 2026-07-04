import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_gradients.dart';
import '../providers/auth_provider.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  AuthProvider? _authProvider;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: AppConstants.animationDuration,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
          ),
        );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.elasticOut),
      ),
    );
    _animationController.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authProvider = context.read<AuthProvider>();
      _authProvider!.addListener(_onAuthChanged);
    });
  }

  @override
  void dispose() {
    _authProvider?.removeListener(_onAuthChanged);
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      final provider = context.read<AuthProvider>();
      provider.signUp(
        _usernameController.text.trim(),
        _passwordController.text,
      );
    }
  }

  void _onAuthChanged() {
    if (!mounted) return;
    final auth = context.read<AuthProvider>();
    if (auth.status != AuthStatus.success) return;
    final user = auth.user;
    if (user == null) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => HomeScreen(username: user.username),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
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
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Form(
                    key: _formKey,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: AppConstants.formMaxWidth,
                      ),
                      child: Consumer<AuthProvider>(
                        builder: (context, auth, _) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildLogo(gradients, colors),
                              const SizedBox(height: 40),
                              _buildHeader(colors),
                              const SizedBox(height: 40),
                              _buildUsernameField(colors),
                              const SizedBox(height: 20),
                              _buildPasswordField(colors),
                              const SizedBox(height: 20),
                              _buildConfirmField(colors),
                              const SizedBox(height: 30),
                              _buildSignUpButton(colors, auth),
                              if (auth.error != null) ...[
                                const SizedBox(height: 12),
                                Text(
                                  auth.error!,
                                  style: TextStyle(
                                    color: colors.error,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ],
                          );
                        },
                      ),
                    ),
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
      animation: _scaleAnimation,
      builder: (context, child) => Transform.scale(
        scale: _scaleAnimation.value,
        child: child,
      ),
      child: Container(
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
    );
  }

  Widget _buildHeader(ColorScheme colors) {
    return Column(
      children: [
        Text(
          'Create Account',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: colors.onSurface,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Set up your credentials to get started',
          style: TextStyle(
            fontSize: 15,
            color: colors.onSurface.withValues(alpha: 0.6),
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameField(ColorScheme colors) {
    return TextFormField(
      controller: _usernameController,
      validator: (v) => v == null || v.isEmpty ? 'Enter username' : null,
      style: TextStyle(color: colors.onSurface, fontSize: 16),
      cursorColor: colors.primary,
      decoration: const InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.person_outline_rounded),
      ),
    );
  }

  Widget _buildPasswordField(ColorScheme colors) {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      validator: (v) {
        if (v == null || v.isEmpty) return 'Enter password';
        if (v.length < 6) return 'At least 6 characters';
        return null;
      },
      style: TextStyle(color: colors.onSurface, fontSize: 16),
      cursorColor: colors.primary,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock_outline_rounded),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
          onPressed: () =>
              setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
    );
  }

  Widget _buildConfirmField(ColorScheme colors) {
    return TextFormField(
      controller: _confirmController,
      obscureText: _obscureConfirm,
      validator: (v) {
        if (v == null || v.isEmpty) return 'Confirm your password';
        if (v != _passwordController.text) return 'Passwords do not match';
        return null;
      },
      style: TextStyle(color: colors.onSurface, fontSize: 16),
      cursorColor: colors.primary,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        prefixIcon: Icon(Icons.lock_outline_rounded),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureConfirm
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
          onPressed: () =>
              setState(() => _obscureConfirm = !_obscureConfirm),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(ColorScheme colors, AuthProvider auth) {
    final isLoading = auth.status == AuthStatus.loading;
    return SizedBox(
      width: double.infinity,
      height: AppConstants.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : _signUp,
        child: isLoading
            ? SizedBox(
                width: 26,
                height: 26,
                child: CircularProgressIndicator(
                  color: colors.onPrimary,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Create Account',
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
