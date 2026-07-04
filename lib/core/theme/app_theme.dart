import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_gradients.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme => _buildTheme(
        brightness: Brightness.dark,
        surface: const Color(0xFF0F0C29),
        onSurface: Colors.white,
        gradients: const AppGradients(
          backgroundStart: AppColors.darkBgStart,
          backgroundMid: AppColors.darkBgMid,
          backgroundEnd: AppColors.darkBgEnd,
          cardStart: AppColors.darkCardStart,
          cardEnd: AppColors.darkCardEnd,
        ),
      );

  static ThemeData get lightTheme => _buildTheme(
        brightness: Brightness.light,
        surface: const Color(0xFFF5F3FF),
        onSurface: const Color(0xFF1A1A2E),
        gradients: const AppGradients(
          backgroundStart: AppColors.lightBgStart,
          backgroundMid: AppColors.lightBgMid,
          backgroundEnd: AppColors.lightBgEnd,
          cardStart: AppColors.lightCardStart,
          cardEnd: AppColors.lightCardEnd,
        ),
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color surface,
    required Color onSurface,
    required AppGradients gradients,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
      surface: surface,
      onSurface: onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      extensions: [gradients],
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.onSurface.withValues(alpha: 0.07),
        labelStyle: TextStyle(
          color: colorScheme.onSurface.withValues(alpha: 0.5),
          fontSize: 16,
        ),
        floatingLabelStyle: TextStyle(color: colorScheme.primary),
        prefixIconColor: colorScheme.onSurface.withValues(alpha: 0.5),
        suffixIconColor: colorScheme.onSurface.withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor:
              colorScheme.primary.withValues(alpha: 0.5),
          disabledForegroundColor:
              colorScheme.onPrimary.withValues(alpha: 0.5),
          elevation: 8,
          shadowColor: colorScheme.primary.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor:
              colorScheme.onSurface.withValues(alpha: 0.5),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
