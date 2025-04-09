import 'package:arc_loader/arc_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ArcLoader renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ArcLoader(
            arcColors: [Colors.red, Colors.green],
            arcWidth: 6.0,
            arcMargin: 10.0,
            innerGap: 4.0,
            style: ArcStyle.simpleArc,
            speed: ArcSpeed.fast,
          ),
        ),
      ),
    );

    // Check if the widget tree contains the CustomPaint used in ArcLoader
    expect(find.byType(CustomPaint), findsOneWidget);

    // Optionally: Take a golden test screenshot (requires flutter driver setup)
    // await expectLater(find.byType(ArcLoader), matchesGoldenFile('loader.png'));
  });
}
