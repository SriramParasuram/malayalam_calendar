// Basic smoke test for the Malayalam wall-calendar app.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:malayalam_calendar/core/utils/malayalam_numerals.dart';
import 'package:malayalam_calendar/main.dart';

void main() {
  testWidgets('Wall calendar renders the current month header', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MalayalamCalendarApp()));
    await tester.pumpAndSettle();

    // The large centred Gregorian day "1" should appear at least once.
    expect(find.text('1'), findsWidgets);
  });

  test('Malayalam numerals convert correctly', () {
    expect(MalayalamNumerals.fromInt(0), '\u0D66');
    expect(MalayalamNumerals.fromInt(15), '\u0D67\u0D6B');
    expect(MalayalamNumerals.fromInt(2026), '\u0D68\u0D66\u0D68\u0D6C');
  });
}
