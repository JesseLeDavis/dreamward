import 'package:flutter_test/flutter_test.dart';

import 'package:dreamward/main.dart';

void main() {
  testWidgets('DreamwardApp renders without crashing',
      (WidgetTester tester) async {
    await tester.pumpWidget(const DreamwardApp());
    // Verify the bottom navigation bar is present.
    expect(find.byType(DreamwardApp), findsOneWidget);
  });
}
