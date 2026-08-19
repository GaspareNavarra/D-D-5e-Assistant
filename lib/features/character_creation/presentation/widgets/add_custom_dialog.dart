import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/catalog_providers.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../../application/character_creation_controller.dart';
import '../../domain/point_buy.dart';

const _hitDice = [6, 8, 10, 12];
const _spellcastingOptions = {'none': 'Nessuno', 'partial': 'Parziale', 'full': 'Pieno'};

/// Opens a form to add a homebrew/custom class, saves it (source =
/// custom), and selects it for the character being created.
Future<void> showAddCustomClassDialog(BuildContext context, WidgetRef ref) async {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  var hitDie = 8;
  var spellcasting = 'none';
  final savingThrows = <String>{};

  final created = await showDialog<bool>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Classe custom'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nome')),
                  const SizedBox(height: AppSpacing.sm),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: 'Descrizione (opzionale)'),
                    maxLines: 2,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text('Dado vita', style: Theme.of(context).textTheme.labelMedium),
                  Wrap(
                    spacing: AppSpacing.xs,
                    children: [
                      for (final d in _hitDice)
                        ChoiceChip(label: Text('d$d'), selected: hitDie == d, onSelected: (_) => setState(() => hitDie = d)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text('Tiri salvezza competenti', style: Theme.of(context).textTheme.labelMedium),
                  Wrap(
                    spacing: AppSpacing.xs,
                    children: [
                      for (final a in abilityOrder)
                        FilterChip(
                          label: Text(a),
                          selected: savingThrows.contains(a),
                          onSelected: (sel) => setState(() => sel ? savingThrows.add(a) : savingThrows.remove(a)),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text('Incantesimi', style: Theme.of(context).textTheme.labelMedium),
                  Wrap(
                    spacing: AppSpacing.xs,
                    children: [
                      for (final e in _spellcastingOptions.entries)
                        ChoiceChip(
                          label: Text(e.value),
                          selected: spellcasting == e.key,
                          onSelected: (_) => setState(() => spellcasting = e.key),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              AppTertiaryButton(label: 'Annulla', onPressed: () => Navigator.of(context).pop(false)),
              AppPrimaryButton(
                label: 'Aggiungi',
                onPressed: nameController.text.trim().isEmpty ? null : () => Navigator.of(context).pop(true),
              ),
            ],
          );
        },
      );
    },
  );

  if (created != true || nameController.text.trim().isEmpty) return;

  final id = await ref
      .read(classRepositoryProvider)
      .addCustom(
        name: nameController.text.trim(),
        hitDie: hitDie,
        savingThrows: savingThrows.toList(),
        spellcasting: spellcasting,
        description: descriptionController.text.trim().isEmpty ? null : descriptionController.text.trim(),
      );
  ref.read(characterCreationControllerProvider.notifier).selectClass(id);
}

/// Opens a form to add a homebrew/custom race, saves it (source =
/// custom), and selects it for the character being created.
Future<void> showAddCustomRaceDialog(BuildContext context, WidgetRef ref) async {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final bonuses = <String, int>{};

  final created = await showDialog<bool>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Razza custom'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nome')),
                  const SizedBox(height: AppSpacing.sm),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: 'Descrizione (opzionale)'),
                    maxLines: 2,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text('Bonus di caratteristica (opzionale)', style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: AppSpacing.xs),
                  for (final a in abilityOrder)
                    Row(
                      children: [
                        SizedBox(width: 48, child: Text(a)),
                        Expanded(
                          child: Slider(
                            value: (bonuses[a] ?? 0).toDouble(),
                            min: 0,
                            max: 2,
                            divisions: 2,
                            label: '+${bonuses[a] ?? 0}',
                            onChanged: (v) => setState(() => bonuses[a] = v.round()),
                          ),
                        ),
                        SizedBox(width: 24, child: Text('+${bonuses[a] ?? 0}')),
                      ],
                    ),
                ],
              ),
            ),
            actions: [
              AppTertiaryButton(label: 'Annulla', onPressed: () => Navigator.of(context).pop(false)),
              AppPrimaryButton(
                label: 'Aggiungi',
                onPressed: nameController.text.trim().isEmpty ? null : () => Navigator.of(context).pop(true),
              ),
            ],
          );
        },
      );
    },
  );

  if (created != true || nameController.text.trim().isEmpty) return;

  bonuses.removeWhere((_, v) => v == 0);
  final id = await ref
      .read(raceRepositoryProvider)
      .addCustom(
        name: nameController.text.trim(),
        abilityBonuses: bonuses,
        description: descriptionController.text.trim().isEmpty ? null : descriptionController.text.trim(),
      );
  ref.read(characterCreationControllerProvider.notifier).selectRace(id);
}
