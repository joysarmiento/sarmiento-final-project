import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// The app's single text field style: a pill-shaped, filled field with no
/// visible border, used on Log in, Sign up, Reset Password, Add Story, and
/// Add Memory — see Design System, section D.
///
/// [label] is what's shown as placeholder text when [hint] is omitted (the
/// Log in / Sign up screens work this way: the field itself is the label).
/// Pass both when a screen shows a separate heading above the field *and*
/// example text inside it (the Reset Password screen does this) — compose
/// the heading as your own Text widget above this one in that case.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  final String label;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        style: const TextStyle(color: AppTheme.onSurface, fontSize: 16),
        decoration: InputDecoration(
          hintText: hint ?? label,
          hintStyle: TextStyle(color: AppTheme.onSurface.withOpacity(0.65)),
          filled: true,
          fillColor: AppTheme.surfaceVariant,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: AppTheme.secondary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: AppTheme.error, width: 1.2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: AppTheme.error, width: 1.5),
          ),
        ),
      ),
    );
  }
}
