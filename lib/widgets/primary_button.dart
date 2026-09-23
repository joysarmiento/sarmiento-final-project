import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// The app's single button style: a full-width, pill-shaped, filled button.
///
/// Appears on Start, Log in, Sign up, Reset Password, Story Details
/// (Update), Add Story (Save Story), and Add Memory (Save Memory) — see
/// Design System, section D.
///
/// [isLoading] is a small addition beyond the spec'd (label, onPressed)
/// signature: it disables the button and swaps the label for a spinner
/// while an async call (sign in, sign up, ...) is in flight.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppTheme.primary,
          foregroundColor: AppTheme.onPrimary,
          disabledBackgroundColor: AppTheme.primary.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppTheme.onPrimary,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
