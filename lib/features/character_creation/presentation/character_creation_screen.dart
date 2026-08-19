import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../application/character_creation_controller.dart';
import 'steps/placeholder_step.dart';
import 'steps/point_buy_step.dart';
import 'steps/race_class_step.dart';
import 'steps/summary_step.dart';

const _stepLabels = ['Razza e classe', 'Point buy', 'Incantesimi', 'Equipaggiamento', 'Riepilogo'];

/// Guided character-creation wizard: Razza e Classe (combined, per
/// product feedback) -> Point Buy -> Incantesimi -> Equipaggiamento ->
/// Riepilogo. State lives in [characterCreationControllerProvider] for
/// the lifetime of this screen; navigating away resets it (autoDispose).
class CharacterCreationScreen extends ConsumerWidget {
  const CharacterCreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(characterCreationControllerProvider);
    final controller = ref.read(characterCreationControllerProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final step = state.currentStep;

    void goBack() {
      if (step == 0) {
        context.go('/home');
      } else {
        controller.previousStep();
      }
    }

    final canAdvance = step != 0 || state.canLeaveRaceClassStep;
    final isLastStep = step == _stepLabels.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.sm, AppSpacing.sm, AppSpacing.md, AppSpacing.sm),
              child: Row(
                children: [
                  IconButton(icon: const Icon(PhosphorIconsRegular.arrowLeft), onPressed: goBack),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nuovo personaggio', style: textTheme.titleLarge),
                        Text(
                          'PASSO ${step + 1} DI ${_stepLabels.length} · ${_stepLabels[step].toUpperCase()}',
                          style: AppTypography.numberStyle(fontSize: 11, color: scheme.onSurface.withValues(alpha: 0.6)),
                        ),
                      ],
                    ),
                  ),
                  const SyncBadge(state: SyncState.localOnly),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: StepperDots(stepCount: _stepLabels.length, currentIndex: step),
            ),
            Expanded(
              child: switch (step) {
                0 => const RaceClassStep(),
                1 => const PointBuyStep(),
                2 => const SpellsPlaceholderStep(),
                3 => const EquipmentPlaceholderStep(),
                _ => const SummaryStep(),
              },
            ),
            if (!isLastStep)
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Expanded(child: AppSecondaryButton(label: 'Indietro', onPressed: goBack)),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: AppPrimaryButton(
                        label: 'Avanti — ${_stepLabels[step + 1]}',
                        onPressed: canAdvance ? controller.nextStep : null,
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
