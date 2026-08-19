import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/local/tables/session_table.dart';
import '../../features/character_creation/presentation/character_creation_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../services/session_provider.dart';
import '../theme/theme.dart';
import '../widgets/widgets.dart';

part 'app_router.g.dart';

/// Root router. Routes are added feature-by-feature as each one is built.
///
/// Gate: `/login` is only reachable when this device hasn't completed
/// onboarding yet ([SessionRepository.getAuthMode] returns null);
/// everywhere else redirects there until it has. Once a session exists,
/// `/login` (and bare `/`) redirect to `/home` instead. `/showcase` is a
/// dev-only design-system sanity check, not a real screen.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final sessionRepository = ref.watch(sessionRepositoryProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) async {
      // Falls back to "no session" on any read error (e.g. the database
      // isn't reachable yet) rather than leaving the router stuck with
      // nothing to show while an unhandled Future sits there rejected.
      bool hasSession;
      try {
        hasSession = await sessionRepository.getAuthMode() != null;
      } catch (_) {
        hasSession = false;
      }
      final onLogin = state.uri.path == '/login';

      if (state.uri.path == '/') return hasSession ? '/home' : '/login';
      if (!hasSession && !onLogin) return '/login';
      if (hasSession && onLogin) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => OnboardingScreen(
          onUseWithoutAccount: () async {
            await sessionRepository.setAuthMode(AuthMode.none);
            if (context.mounted) context.go('/home');
          },
          onContinue: () => context.go('/showcase'),
        ),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/characters/new', builder: (context, state) => const CharacterCreationScreen()),
      GoRoute(
        path: '/showcase',
        builder: (context, state) => const _PlaceholderHome(),
      ),
    ],
  );
}

/// Design-system showcase / temporary post-onboarding landing spot while
/// the real screens (character creation, sheet, spellbook, ...) are
/// being built one by one.
class _PlaceholderHome extends StatefulWidget {
  const _PlaceholderHome();

  @override
  State<_PlaceholderHome> createState() => _PlaceholderHomeState();
}

class _PlaceholderHomeState extends State<_PlaceholderHome> {
  bool _isDm = false;
  bool _isOnline = true;
  final _slots = [SpellSlotState.available, SpellSlotState.available, SpellSlotState.spent, SpellSlotState.temporary];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveScaffold(
      destinations: const [
        AppNavDestination(icon: Icons.badge_outlined, label: 'Scheda'),
        AppNavDestination(icon: Icons.auto_stories_outlined, label: 'Grimorio'),
        AppNavDestination(icon: Icons.style_outlined, label: 'Card'),
        AppNavDestination(icon: Icons.groups_outlined, label: 'Campagne'),
      ],
      selectedIndex: 0,
      onDestinationSelected: (_) {},
      appBar: AppBar(title: const Text('D&D Assistant')),
      bottomBar: AiAssistantBar(
        isOnline: _isOnline,
        isDm: _isDm,
        suggestionChips: _isDm ? const ['Genera un PNG', 'Genera un incontro'] : const ['Spiega una regola', 'Suggerisci una combo'],
      ),
      builder: (context, breakpoint) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoleBar(isDm: _isDm),
              const SizedBox(height: AppSpacing.md),
              Text('D&D Assistant', style: textTheme.headlineMedium),
              Text('Breakpoint attuale: ${breakpoint.name}', style: textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  AppPrimaryButton(label: 'Azione primaria', onPressed: () {}),
                  AppSecondaryButton(label: 'Secondaria', onPressed: () {}),
                  AppTertiaryButton(label: 'Terziaria', onPressed: () {}),
                  const HomebrewTag(),
                  const SyncBadge(state: SyncState.synced),
                  const SyncBadge(state: SyncState.localOnly),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              const StepperDots(stepCount: 6, currentIndex: 2),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final s in _slots)
                    SpellSlotPip(
                      state: s,
                      onSpend: () {},
                      onRecover: () {},
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Text('16 · +3 · 8d6 · CA 16', style: AppTypography.numberStyle(fontSize: 24)),
              const SizedBox(height: AppSpacing.lg),
              PrintCardWidget(
                data: const PrintCardData(
                  name: 'Palla di Fuoco',
                  category: 'Evocazione',
                  levelOrRarity: 'Livello 3',
                  stats: [
                    PrintCardStat(label: 'Lancio', value: '1 azione'),
                    PrintCardStat(label: 'Gittata', value: '45 m'),
                    PrintCardStat(label: 'Componenti', value: 'V, S, M'),
                    PrintCardStat(label: 'Durata', value: 'Istantanea'),
                  ],
                  description:
                      'Una luce brillante parte dal tuo dito indice fino a un punto che scegli entro gittata, dove esplode in un boato in un raggio di 6 metri.',
                  source: 'SRD',
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              SwitchListTile(
                title: const Text('Contesto DM'),
                value: _isDm,
                onChanged: (v) => setState(() => _isDm = v),
              ),
              SwitchListTile(
                title: const Text('Online'),
                value: _isOnline,
                onChanged: (v) => setState(() => _isOnline = v),
              ),
            ],
          ),
        );
      },
    );
  }
}
