import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/catalog_providers.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../data/local/database.dart';
import '../../../../data/local/tables/class_race_data_codec.dart';
import '../../application/character_creation_controller.dart';
import '../../domain/ability_advice.dart';
import '../../domain/point_buy.dart';

/// Step 2: 27-point buy, with a deterministic advice card standing in
/// for the future AI-generated build suggestion.
class PointBuyStep extends ConsumerWidget {
  const PointBuyStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(characterCreationControllerProvider);
    final controller = ref.read(characterCreationControllerProvider.notifier);
    final classes = ref.watch(classesListProvider).value ?? const <ClassRow>[];
    final races = ref.watch(racesListProvider).value ?? const <RaceRow>[];
    final selectedClass = classes.where((c) => c.id == state.classId).firstOrNull;
    final selectedRace = races.where((r) => r.id == state.raceId).firstOrNull;
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    if (selectedClass == null || selectedRace == null) {
      // Shouldn't normally happen (the wizard blocks leaving step 0
      // without both picked), but keeps this step from crashing if it
      // ever does.
      return const Center(child: Text('Scegli prima razza e classe.'));
    }

    final raceBonuses = decodeRaceData(selectedRace.dataJson).abilityBonuses;
    final pointsRemaining = state.pointsRemaining;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$pointsRemaining',
                style: AppTypography.numberStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: pointsRemaining < 0 ? Theme.of(context).colorScheme.error : scheme.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('PUNTI RIMASTI', style: AppTypography.numberStyle(fontSize: 11, color: scheme.onSurface.withValues(alpha: 0.6))),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (state.pointsSpent / AppConstants.pointBuyBudget).clamp(0, 1),
              minHeight: 6,
              backgroundColor: Theme.of(context).extension<AppSemanticColors>()!.hairline,
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${state.pointsSpent} di ${AppConstants.pointBuyBudget} spesi · ${selectedRace.name} · ${selectedClass.name}',
            style: textTheme.bodySmall?.copyWith(color: scheme.onSurface.withValues(alpha: 0.6)),
          ),
          const SizedBox(height: AppSpacing.lg),
          _AdviceCard(classRow: selectedClass, raceRow: selectedRace, onApply: controller.applyAbilityScores),
          const SizedBox(height: AppSpacing.lg),
          for (final ability in abilityOrder)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _AbilityRow(
                ability: ability,
                score: state.abilityScores[ability] ?? pointBuyMin,
                racialBonus: raceBonuses[ability] ?? 0,
                canIncrement: (state.abilityScores[ability] ?? pointBuyMin) < pointBuyMax && pointsRemaining > 0,
                canDecrement: (state.abilityScores[ability] ?? pointBuyMin) > pointBuyMin,
                onIncrement: () => controller.incrementAbility(ability),
                onDecrement: () => controller.decrementAbility(ability),
              ),
            ),
        ],
      ),
    );
  }
}

class _AdviceCard extends StatelessWidget {
  final ClassRow classRow;
  final RaceRow raceRow;
  final ValueChanged<Map<String, int>> onApply;

  const _AdviceCard({required this.classRow, required this.raceRow, required this.onApply});

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final primary = classPrimaryAbility(classRow.name);
    final suggestion = suggestAbilityScores(classRow.name);
    final reason = abilityRoleReason[primary] ?? 'il tuo stile di gioco';

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        border: Border.all(color: semantic.gold, width: AppDimens.hairlineWidth),
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(PhosphorIconsRegular.sparkle, size: AppIconSize.standard, color: semantic.gold),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'Per un ${classRow.name} con razza ${raceRow.name} conviene $primary ${suggestion[primary]} '
                  '${primary != 'CON' ? "e CON ${suggestion['CON']}" : ''}: il $primary regge $reason.',
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              AppPrimaryButton(label: 'Applica consiglio', onPressed: () => onApply(suggestion)),
              const SizedBox(width: AppSpacing.sm),
              AppTertiaryButton(
                label: 'Perché?',
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Suggerimento basato sulle regole ($primary per $reason, CON per i punti ferita) — non ancora "
                      "generato da un'IA reale.",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AbilityRow extends StatelessWidget {
  final String ability;
  final int score;
  final int racialBonus;
  final bool canIncrement;
  final bool canDecrement;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _AbilityRow({
    required this.ability,
    required this.score,
    required this.racialBonus,
    required this.canIncrement,
    required this.canDecrement,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final finalScore = score + racialBonus;
    final modifier = ((finalScore - 10) / 2).floor();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        border: Border.all(color: semantic.hairline, width: AppDimens.hairlineWidth),
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ability, style: AppTypography.numberStyle(fontSize: 13, fontWeight: FontWeight.w600, color: scheme.primary)),
                Text(abilityLabels[ability] ?? '', style: textTheme.bodySmall),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$finalScore', style: AppTypography.numberStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                Text(
                  racialBonus > 0 ? '+$racialBonus razza → $finalScore' : 'costo ${pointBuyCost(score)}',
                  style: textTheme.bodySmall?.copyWith(color: scheme.onSurface.withValues(alpha: 0.6)),
                ),
              ],
            ),
          ),
          Text(
            modifier >= 0 ? '+$modifier' : '$modifier',
            style: AppTypography.numberStyle(fontSize: 16, color: scheme.onSurface.withValues(alpha: 0.7)),
          ),
          const SizedBox(width: AppSpacing.sm),
          _StepperButton(icon: PhosphorIconsRegular.minus, onPressed: canDecrement ? onDecrement : null),
          const SizedBox(width: AppSpacing.xs),
          _StepperButton(icon: PhosphorIconsRegular.plus, onPressed: canIncrement ? onIncrement : null, highlighted: true),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final bool highlighted;

  const _StepperButton({required this.icon, required this.onPressed, this.highlighted = false});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final active = onPressed != null;

    return SizedBox(
      width: AppDimens.minTapTarget,
      height: AppDimens.minTapTarget,
      child: IconButton(
        icon: Icon(icon, size: AppIconSize.dense),
        onPressed: onPressed,
        style: IconButton.styleFrom(
          side: BorderSide(color: highlighted && active ? scheme.primary : semantic.hairline, width: AppDimens.hairlineWidth),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.xs)),
          foregroundColor: active ? scheme.onSurface : semantic.hairline,
        ),
      ),
    );
  }
}
