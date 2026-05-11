import 'package:flutter/material.dart';

/// Notebook / vellum surface tokens — used by the redesigned dream-entry
/// screen. Lives parallel to AppColors; do not consume from feature code
/// outside the notebook surface.
abstract final class PaperColors {
  static const Color paperBase    = Color(0xFFE8DFC4); // vellum surface
  static const Color paperShadow  = Color(0xFFD8CDA8); // inset top shadow
  static const Color paperFold    = Color(0xFFC9BC93); // edge / fold line
  static const Color inkPrimary   = Color(0xFF2B2418); // walnut ink — body
  static const Color inkSecondary = Color(0xFF5C5340); // faded ink — labels
  static const Color inkMuted     = Color(0xFF8A7E60); // hint text
  static const Color inkAccent    = Color(0xFF8A5A1A); // amber-brown — active
  static const Color ruleLine     = Color(0x33C9BC93); // ~20% paperFold
  static const Color stampRed     = Color(0xFFA33B2A); // lucidity stamp
}

/// A vellum page inserted into the dark device chrome.
///
/// Wraps its [child] in a paper-toned surface with a soft inset shadow at
/// the top (the page tucked under the app bar) and faint fold lines along
/// the left/right edges.
class PaperPage extends StatelessWidget {
  const PaperPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: PaperColors.paperBase,
        border: Border(
          left: BorderSide(color: PaperColors.paperFold, width: 1),
          right: BorderSide(color: PaperColors.paperFold, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Soft shadow gradient — the page sliding under the device frame.
          Container(
            height: 12,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [PaperColors.paperShadow, PaperColors.paperBase],
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

/// A faint horizontal rule — notebook line. Use for the date underline and
/// the entry-field guide lines.
class PaperRule extends StatelessWidget {
  const PaperRule({super.key, this.indent = 0});

  final double indent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: indent, right: indent),
      child: Container(height: 1, color: PaperColors.ruleLine),
    );
  }
}
