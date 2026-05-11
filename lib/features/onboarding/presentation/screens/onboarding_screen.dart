import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/tutorial_content.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

// ---------------------------------------------------------------------------
// Page data
// ---------------------------------------------------------------------------

class _OnboardingPage {
  const _OnboardingPage({
    required this.index,
    required this.title,
    required this.body,
    this.diagram,
  });

  final String index;   // '01', '02', etc.
  final String title;
  final String body;
  final Widget? diagram;
}

// ---------------------------------------------------------------------------
// Main screen
// ---------------------------------------------------------------------------

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  static const _totalPages = 5;

  late final List<_OnboardingPage> _pages = [
    const _OnboardingPage(
      index: '01',
      title: TutorialContent.slide1Title,
      body: TutorialContent.slide1Body,
    ),
    _OnboardingPage(
      index: '02',
      title: TutorialContent.slide2Title,
      body: TutorialContent.slide2Body,
      diagram: const _PhaseBar(),
    ),
    _OnboardingPage(
      index: '03',
      title: TutorialContent.slide3Title,
      body: TutorialContent.slide3Body,
      diagram: const _OnsetIndicator(),
    ),
    const _OnboardingPage(
      index: '04',
      title: TutorialContent.slide4Title,
      body: TutorialContent.slide4Body,
    ),
    const _OnboardingPage(
      index: '05',
      title: TutorialContent.slide5Title,
      body: TutorialContent.slide5Body,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);
    if (mounted) {
      context.go('/today');
    }
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      body: SafeArea(
        child: Column(
          children: [
            // ----------------------------------------------------------------
            // Top bar: page indicator + SKIP
            // ----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH,
                vertical: AppSpacing.screenV,
              ),
              child: Row(
                children: [
                  Text(
                    '${_pages[_currentPage].index} / 0$_totalPages',
                    style: AppTypography.timestamp,
                  ),
                  const Spacer(),
                  if (_currentPage < _totalPages - 1)
                    GestureDetector(
                      onTap: _completeOnboarding,
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: Text('SKIP', style: AppTypography.label),
                      ),
                    ),
                ],
              ),
            ),

            // ----------------------------------------------------------------
            // Page content
            // ----------------------------------------------------------------
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _totalPages,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenH,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSpacing.xxl),
                        Text(
                          page.title,
                          style: AppTypography.displayAmber.copyWith(
                            fontSize: 26,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),
                        Container(
                          height: 1,
                          width: 48,
                          color: AppColors.amber,
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),
                        Text(
                          page.body,
                          style: AppTypography.body.copyWith(height: 1.7),
                        ),
                        if (page.diagram != null) ...[
                          const SizedBox(height: AppSpacing.xl),
                          page.diagram!,
                        ],
                        const SizedBox(height: AppSpacing.xl),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ----------------------------------------------------------------
            // Bottom bar: dot indicators + NEXT / BEGIN
            // ----------------------------------------------------------------
            Container(
              height: 1,
              color: AppColors.borderSubtle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH,
                vertical: 20,
              ),
              child: Row(
                children: [
                  // Dot indicators
                  Row(
                    children: List.generate(_totalPages, (i) {
                      final isActive = i == _currentPage;
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Container(
                          width: isActive ? 8 : 6,
                          height: isActive ? 8 : 6,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.amber
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isActive
                                  ? AppColors.amber
                                  : AppColors.borderStrong,
                              width: 1,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  // NEXT / BEGIN button
                  if (_currentPage < _totalPages - 1)
                    GestureDetector(
                      onTap: _nextPage,
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.amber),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'NEXT →',
                          style: AppTypography.label.copyWith(
                            color: AppColors.amber,
                          ),
                        ),
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: _completeOnboarding,
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'BEGIN →',
                          style: AppTypography.labelAmber.copyWith(
                            color: AppColors.textInverse,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Diagram: Phase Bar (slide 2)
// ---------------------------------------------------------------------------

class _PhaseBar extends StatelessWidget {
  const _PhaseBar();

  static const _phases = ['PHASE I', 'PHASE II', 'PHASE III', 'PHASE IV'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderNormal),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: List.generate(_phases.length, (i) {
          final isLast = i == _phases.length - 1;
          // Opacity increases from dim to full across segments
          final intensity = (i + 1) / _phases.length;
          final segmentColor = Color.lerp(
            AppColors.amberMuted,
            AppColors.amber,
            intensity,
          )!;

          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: isLast
                    ? null
                    : const Border(
                        right: BorderSide(color: AppColors.borderNormal),
                      ),
                color: AppColors.backgroundSurface,
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              child: Column(
                children: [
                  Container(
                    height: 3,
                    color: segmentColor,
                    margin: const EdgeInsets.only(bottom: 8),
                  ),
                  Text(
                    _phases[i],
                    style: AppTypography.label.copyWith(
                      color: segmentColor,
                      fontSize: 9,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Diagram: Onset Indicator (slide 3)
// ---------------------------------------------------------------------------

class _OnsetIndicator extends StatelessWidget {
  const _OnsetIndicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderNormal),
        color: AppColors.backgroundSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(AppSpacing.cardPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ONSET INTENSITY',
            style: AppTypography.label,
          ),
          const SizedBox(height: AppSpacing.md),
          _OnsetSegment(
            label: 'SURGE',
            height: 20,
            color: AppColors.amber,
          ),
          const SizedBox(height: 4),
          _OnsetSegment(
            label: 'STRONG',
            height: 13,
            color: AppColors.amberDim,
          ),
          const SizedBox(height: 4),
          _OnsetSegment(
            label: 'TRACE',
            height: 7,
            color: AppColors.amberMuted.withValues(alpha: 0.8),
          ),
        ],
      ),
    );
  }
}

class _OnsetSegment extends StatelessWidget {
  const _OnsetSegment({
    required this.label,
    required this.height,
    required this.color,
  });

  final String label;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 52,
          child: Text(
            label,
            style: AppTypography.label.copyWith(
              fontSize: 9,
              color: color == AppColors.amberMuted
                  ? AppColors.textMuted
                  : AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: height,
            color: color,
          ),
        ),
      ],
    );
  }
}
