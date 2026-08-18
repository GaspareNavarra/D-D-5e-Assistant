import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:dnd_assistant/core/routing/app_router.dart';
import 'package:dnd_assistant/features/onboarding/presentation/onboarding_screen.dart';
import 'package:dnd_assistant/main.dart';

void main() {
  testWidgets('App boots and shows the onboarding screen', (WidgetTester tester) async {
    // Overrides the real router (which reads the local session from
    // Drift) with a fixed one straight to onboarding: this is a shell
    // smoke test, not a routing/persistence test, and flutter test's
    // host has no native sqlite3 available to open a real database
    // against.
    final testRouter = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => OnboardingScreen(onUseWithoutAccount: () {}, onContinue: () {}),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appRouterProvider.overrideWithValue(testRouter)],
        child: const DndAssistantApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('D&D Assistant'), findsOneWidget);
    expect(find.text('Continua con email'), findsOneWidget);
    expect(find.text('Usa senza account'), findsOneWidget);
  });
}
