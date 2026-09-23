import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';

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
        style: GoogleFonts.montserrat(
          color: AppTheme.onSurface,
          fontSize: 15,
          fontWeight: FontWeight.w600, // semibold
        ),
        decoration: InputDecoration(
          hintText: hint ?? label,
          hintStyle: GoogleFonts.montserrat(
            color: AppTheme.onSurface.withValues(alpha: 0.75),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          filled: true,
          fillColor: AppTheme.surfaceVariant,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 15,
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
