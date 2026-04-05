import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/theme/app_colors.dart';
import 'onboarding_screen.dart';

/// Checks whether onboarding has been completed on initState.
/// - If not yet determined: shows a blank scaffold (avoids flash of wrong content).
/// - If complete: redirects to /today via post-frame callback.
/// - If not complete: renders the OnboardingScreen directly.
class OnboardingGate extends StatefulWidget {
  const OnboardingGate({super.key});

  @override
  State<OnboardingGate> createState() => _OnboardingGateState();
}

class _OnboardingGateState extends State<OnboardingGate> {
  bool? _completed;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      if (mounted) {
        setState(() => _completed = prefs.getBool('onboarding_complete') ?? false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_completed == null) {
      // Still loading — blank screen in app background color to avoid flash.
      return const Scaffold(backgroundColor: AppColors.backgroundBase);
    }

    if (_completed!) {
      // Already completed — redirect to today after the current frame.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go('/today');
      });
      return const Scaffold(backgroundColor: AppColors.backgroundBase);
    }

    return const OnboardingScreen();
  }
}
