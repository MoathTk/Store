import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../../../core/constants/app_constants.dart';
import '../providers/auth_provider.dart';
import '../widgets/gradient_scaffold.dart';
import '../widgets/animated_logo.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/loading_button.dart';
import '../widgets/error_message.dart';
import '../../../../features/dashboard/presentation/screens/dashboard_screen.dart';

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
      context.read<AuthProvider>().signUp(
            _usernameController.text.trim(),
            _passwordController.text.trim(),
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
        pageBuilder: (_, __, ___) => DashboardScreen(username: user.username),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GradientScaffold(
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
                        AnimatedLogo(
                          animation: _scaleAnimation,
                          size: 100,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          S.of(context)!.signupTitle,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          S.of(context)!.signupSubtitle,
                          style: TextStyle(
                            fontSize: 15,
                            color: colors.onSurface.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 40),
                        AuthTextField(
                          controller: _usernameController,
                          icon: Icons.person_outline_rounded,
                          label: S.of(context)!.loginUsernameLabel,
                          validator: (v) =>
                              v == null || v.isEmpty ? S.of(context)!.loginUsernameError : null,
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          controller: _passwordController,
                          icon: Icons.lock_outline_rounded,
                          label: S.of(context)!.loginPasswordLabel,
                          obscure: true,
                          validator: (v) {
                            if (v == null || v.isEmpty) return S.of(context)!.loginPasswordError;
                            if (v.length < 6) return S.of(context)!.signupPasswordMinLength;
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          controller: _confirmController,
                          icon: Icons.lock_outline_rounded,
                          label: S.of(context)!.signupConfirmLabel,
                          obscure: true,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return S.of(context)!.signupConfirmErrorEmpty;
                            }
                            if (v != _passwordController.text) {
                              return S.of(context)!.signupConfirmErrorMismatch;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        LoadingButton(
                          isLoading: auth.status == AuthStatus.loading,
                          onPressed: _signUp,
                          label: S.of(context)!.signupCreateAccount,
                        ),
                        ErrorMessage(message: auth.error),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
