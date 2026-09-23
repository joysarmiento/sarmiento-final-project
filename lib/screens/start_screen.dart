import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';
import 'login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spaceLg),
          child: Column(
            children: [
              const Spacer(flex: 3),
              // TODO: swap this stand-in for the real Story Shelf logo.
              // Export it from Figma/Canva to assets/images/logo.png, list
              // it under pubspec.yaml's flutter: assets:, and replace this
              // Container with Image.asset('assets/images/logo.png').
              Image.asset('assets/images/logo.png'),
              const SizedBox(height: AppTheme.spaceMd),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Story Shelf',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontStyle: FontStyle.italic, // stand-in for the
                  ), // script font used in the mockup logo
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                'Your stories. Your memories.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(flex: 5),
              PrimaryButton(
                label: 'Get started',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
              ),
              const SizedBox(height: AppTheme.spaceLg),
            ],
          ),
        ),
      ),
    );
  }
}
