import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../../core/services/catalog_providers.dart';
import '../../../../core/theme/theme.dart';
import '../../../../data/local/database.dart';
import '../../../../data/local/tables/reference_tables.dart';
import '../../application/character_creation_controller.dart';
import '../../domain/race_class_synergy.dart';
import '../widgets/add_custom_dialog.dart';

/// Step 1: name, class, race — combined on one screen per product
/// feedback (rather than two separate steps), with a button to add a
/// homebrew/custom entry next to each catalog.
class RaceClassStep extends ConsumerWidget {
  const RaceClassStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Kicks off the one-time official-content seed if it hasn't run yet.
    ref.watch(catalogSeedProvider);

    final classesAsync = ref.watch(classesListProvider);
    final racesAsync = ref.watch(racesListProvider);
    final state = ref.watch(characterCreationControllerProvider);
    final controller = ref.read(characterCreationControllerProvider.notifier);
    final textTheme = Theme.of(context).textTheme;

    final classes = classesAsync.value ?? const <ClassRow>[];
    final races = racesAsync.value ?? const <RaceRow>[];
    final selectedClass = classes.where((c) => c.id == state.classId).firstOrNull;
    final selectedRace = races.where((r) => r.id == state.raceId).firstOrNull;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Nome personaggio'),
            controller: TextEditingController(text: state.name)
              ..selection = TextSelection.collapsed(offset: state.name.length),
            onChanged: controller.setName,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Classe', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          if (classesAsync.isLoading && classes.isEmpty)
            const Padding(padding: EdgeInsets.all(AppSpacing.md), child: LinearProgressIndicator())
          else
            _CatalogWrap(
              entries: [for (final c in classes) (id: c.id, label: c.name, isCustom: c.source == DataSource.custom)],
              selectedId: state.classId,
              onSelect: controller.selectClass,
              onAddCustom: () => showAddCustomClassDialog(context, ref),
              addLabel: 'Classe custom',
            ),
          const SizedBox(height: AppSpacing.lg),
          Text('Razza', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          if (racesAsync.isLoading && races.isEmpty)
            const Padding(padding: EdgeInsets.all(AppSpacing.md), child: LinearProgressIndicator())
          else
            _CatalogWrap(
              entries: [for (final r in races) (id: r.id, label: r.name, isCustom: r.source == DataSource.custom)],
              selectedId: state.raceId,
              onSelect: controller.selectRace,
              onAddCustom: () => showAddCustomRaceDialog(context, ref),
              addLabel: 'Razza custom',
            ),
          if (selectedClass != null && selectedRace != null) ...[
            const SizedBox(height: AppSpacing.lg),
            _SynergyPanel(classRow: selectedClass, raceRow: selectedRace),
          ],
        ],
      ),
    );
  }
}

typedef _CatalogEntry = ({String id, String label, bool isCustom});

class _CatalogWrap extends StatelessWidget {
  final List<_CatalogEntry> entries;
  final String? selectedId;
  final ValueChanged<String> onSelect;
  final VoidCallback onAddCustom;
  final String addLabel;

  const _CatalogWrap({
    required this.entries,
    required this.selectedId,
    required this.onSelect,
    required this.onAddCustom,
    required this.addLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        for (final e in entries)
          _SelectableChip(label: e.label, isCustom: e.isCustom, selected: e.id == selectedId, onTap: () => onSelect(e.id)),
        ActionChip(
          avatar: const Icon(PhosphorIconsRegular.plus, size: AppIconSize.dense),
          label: Text(addLabel),
          onPressed: onAddCustom,
        ),
      ],
    );
  }
}

class _SelectableChip extends StatelessWidget {
  final String label;
  final bool isCustom;
  final bool selected;
  final VoidCallback onTap;

  const _SelectableChip({required this.label, required this.isCustom, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;

    return ChoiceChip(
      selected: selected,
      onSelected: (_) => onTap(),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selected) ...[
            Icon(PhosphorIconsRegular.check, size: AppIconSize.dense, color: scheme.primary),
            const SizedBox(width: AppSpacing.xs),
          ],
          Text(label),
          if (isCustom) ...[const SizedBox(width: AppSpacing.xs), Icon(PhosphorIconsRegular.sparkle, size: 12, color: semantic.gold)],
        ],
      ),
      side: BorderSide(color: selected ? scheme.primary : semantic.hairline, width: selected ? 1.5 : 1),
      selectedColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      labelStyle: TextStyle(color: selected ? scheme.primary : scheme.onSurface),
      showCheckmark: false,
    );
  }
}

class _SynergyPanel extends StatelessWidget {
  final ClassRow classRow;
  final RaceRow raceRow;

  const _SynergyPanel({required this.classRow, required this.raceRow});

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final points = computeRaceClassSynergy(classRow: classRow, raceRow: raceRow);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sinergia con ${raceRow.name}', style: textTheme.labelLarge?.copyWith(color: semantic.gold)),
            const SizedBox(height: AppSpacing.sm),
            for (final p in points)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      p.positive ? PhosphorIconsRegular.check : PhosphorIconsRegular.minus,
                      size: AppIconSize.dense,
                      color: p.positive ? semantic.ok : semantic.hairline,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(child: Text(p.text, style: textTheme.bodyMedium)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
