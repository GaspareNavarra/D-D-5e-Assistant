import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dnd_assistant/main.dart';

void main() {
  testWidgets('App boots and shows the placeholder home screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: DndAssistantApp()),
    );
    await tester.pumpAndSettle();

    expect(find.text('D&D Assistant'), findsWidgets);
  });
}
