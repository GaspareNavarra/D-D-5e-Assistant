import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/catalog_providers.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../data/local/database.dart';
import '../../../../data/local/tables/class_race_data_codec.dart';
import '../../application/character_creation_controller.dart';
import '../../domain/point_buy.dart';

/// Step 5: final review + the "Salva" action that actually persists the
/// character_base + its local instance.
class SummaryStep extends ConsumerStatefulWidget {
  const SummaryStep({super.key});

  @override
  ConsumerState<SummaryStep> createState() => _SummaryStepState();
}

class _SummaryStepState extends ConsumerState<SummaryStep> {
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(characterCreationControllerProvider);
    final classes = ref.watch(classesListProvider).value ?? const <ClassRow>[];
    final races = ref.watch(racesListProvider).value ?? const <RaceRow>[];
    final selectedClass = classes.where((c) => c.id == state.classId).firstOrNull;
    final selectedRace = races.where((r) => r.id == state.raceId).firstOrNull;
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    if (selectedClass == null || selectedRace == null) {
      return const Center(child: Text('Scegli prima razza e classe.'));
    }

    final raceBonuses = decodeRaceData(selectedRace.dataJson).abilityBonuses;
    final Map<String, int> finalScores = {
      for (final a in abilityOrder) a: (state.abilityScores[a] ?? pointBuyMin) + (raceBonuses[a] ?? 0),
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(state.name, style: textTheme.headlineSmall),
          Text('${selectedRace.name} · ${selectedClass.name} · Livello 1', style: textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.md,
                children: [
                  for (final a in abilityOrder)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(a, style: AppTypography.numberStyle(fontSize: 12, color: scheme.primary)),
                        Text('${finalScores[a]}', style: AppTypography.numberStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                      ],
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppPrimaryButton(
            label: _saving ? 'Salvataggio…' : 'Salva personaggio',
            onPressed: _saving ? null : () => _save(context, finalScores),
          ),
        ],
      ),
    );
  }

  Future<void> _save(BuildContext context, Map<String, int> finalScores) async {
    setState(() => _saving = true);
    try {
      await ref.read(characterCreationControllerProvider.notifier).save(finalScores);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Personaggio creato!')));
        context.go('/home');
      }
    } catch (e) {
      if (context.mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Errore nel salvataggio: $e')));
      }
    }
  }
}
