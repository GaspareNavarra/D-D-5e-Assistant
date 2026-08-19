import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../../core/services/catalog_providers.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../data/local/database.dart';
import '../../../../data/local/tables/class_race_data_codec.dart';
import '../../../../data/local/tables/reference_tables.dart';
import '../../application/character_creation_controller.dart';
import '../../domain/catalog_icons.dart';
import '../../domain/race_class_synergy.dart';
import '../widgets/add_custom_dialog.dart';

/// Step 1: name, class, race — combined on one screen per product
/// feedback, styled as list+detail master-detail panels (matching the
/// reference design) rather than a chip wrap. On >=medium breakpoints
/// the list and its detail sit side by side; on phone widths they stack.
class RaceClassStep extends ConsumerStatefulWidget {
  const RaceClassStep({super.key});

  @override
  ConsumerState<RaceClassStep> createState() => _RaceClassStepState();
}

class _RaceClassStepState extends ConsumerState<RaceClassStep> {
  late final TextEditingController _nameController;
  final _classSearchController = TextEditingController();
  final _raceSearchController = TextEditingController();
  String _classQuery = '';
  String _raceQuery = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: ref.read(characterCreationControllerProvider).name);
    _nameController.addListener(() {
      ref.read(characterCreationControllerProvider.notifier).setName(_nameController.text);
    });
    _classSearchController.addListener(() => setState(() => _classQuery = _classSearchController.text));
    _raceSearchController.addListener(() => setState(() => _raceQuery = _raceSearchController.text));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _classSearchController.dispose();
    _raceSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Kicks off the one-time official-content seed if it hasn't run yet.
    ref.watch(catalogSeedProvider);

    final classes = ref.watch(classesListProvider).value ?? const <ClassRow>[];
    final races = ref.watch(racesListProvider).value ?? const <RaceRow>[];
    final state = ref.watch(characterCreationControllerProvider);
    final controller = ref.read(characterCreationControllerProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
    final isWide = appBreakpointOf(context) != AppBreakpoint.compact;

    final selectedClass = classes.where((c) => c.id == state.classId).firstOrNull;
    final selectedRace = races.where((r) => r.id == state.raceId).firstOrNull;

    final filteredClasses = classes.where((c) => c.name.toLowerCase().contains(_classQuery.toLowerCase())).toList();
    final filteredRaces = races.where((r) => r.name.toLowerCase().contains(_raceQuery.toLowerCase())).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Nome personaggio')),
          const SizedBox(height: AppSpacing.lg),
          Text('Classe', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          _CatalogSection(
            isWide: isWide,
            searchController: _classSearchController,
            searchHint: 'Cerca classe',
            items: [
              for (final c in filteredClasses)
                _CatalogListItem(id: c.id, name: c.name, subtitle: _classSubtitle(c), icon: classIcon(c.name), isCustom: c.source == DataSource.custom),
            ],
            selectedId: state.classId,
            onSelect: controller.selectClass,
            onAddCustom: () => showAddCustomClassDialog(context, ref),
            addLabel: 'Classe custom',
            detail: selectedClass == null
                ? const _EmptyDetailHint(label: 'una classe')
                : _ClassDetailPanel(classRow: selectedClass),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Razza', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          _CatalogSection(
            isWide: isWide,
            searchController: _raceSearchController,
            searchHint: 'Cerca razza',
            items: [
              for (final r in filteredRaces)
                _CatalogListItem(id: r.id, name: r.name, subtitle: _raceSubtitle(r), icon: raceIcon(r.name), isCustom: r.source == DataSource.custom),
            ],
            selectedId: state.raceId,
            onSelect: controller.selectRace,
            onAddCustom: () => showAddCustomRaceDialog(context, ref),
            addLabel: 'Razza custom',
            detail: selectedRace == null ? const _EmptyDetailHint(label: 'una razza') : _RaceDetailPanel(raceRow: selectedRace),
          ),
          if (selectedClass != null && selectedRace != null) ...[
            const SizedBox(height: AppSpacing.lg),
            _SynergyAndNextPanel(classRow: selectedClass, raceRow: selectedRace, isWide: isWide),
          ],
        ],
      ),
    );
  }
}

String _classSubtitle(ClassRow c) {
  final data = decodeClassData(c.dataJson);
  final casterLabel = switch (data.spellcasting) {
    'full' => 'incantatore pieno',
    'partial' => 'incantatore parziale',
    _ => 'nessun incantesimo',
  };
  final saves = data.savingThrows.isEmpty ? '—' : data.savingThrows.join('/');
  return 'd${c.hitDie} · $saves · $casterLabel';
}

String _raceSubtitle(RaceRow r) {
  final data = decodeRaceData(r.dataJson);
  if (data.abilityBonuses.isEmpty) return 'Nessun bonus di caratteristica';
  return data.abilityBonuses.entries.map((e) => '+${e.value} ${e.key}').join(' · ');
}

/// One entry in a catalog list — deliberately not tied to [ClassRow]/
/// [RaceRow] directly, so [_CatalogList] doesn't care which catalog it's
/// rendering.
class _CatalogListItem {
  final String id;
  final String name;
  final String subtitle;
  final IconData icon;
  final bool isCustom;

  const _CatalogListItem({required this.id, required this.name, required this.subtitle, required this.icon, required this.isCustom});
}

/// Search field + list on one side, detail panel on the other — side by
/// side from medium width up, stacked on phone.
class _CatalogSection extends StatelessWidget {
  final bool isWide;
  final TextEditingController searchController;
  final String searchHint;
  final List<_CatalogListItem> items;
  final String? selectedId;
  final ValueChanged<String> onSelect;
  final VoidCallback onAddCustom;
  final String addLabel;
  final Widget detail;

  const _CatalogSection({
    required this.isWide,
    required this.searchController,
    required this.searchHint,
    required this.items,
    required this.selectedId,
    required this.onSelect,
    required this.onAddCustom,
    required this.addLabel,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    final list = _CatalogList(
      searchController: searchController,
      searchHint: searchHint,
      items: items,
      selectedId: selectedId,
      onSelect: onSelect,
      onAddCustom: onAddCustom,
      addLabel: addLabel,
    );

    final detailCard = Card(child: Padding(padding: const EdgeInsets.all(AppSpacing.md), child: detail));

    if (!isWide) {
      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [list, const SizedBox(height: AppSpacing.sm), detailCard]);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 300, child: list),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: detailCard),
      ],
    );
  }
}

class _CatalogList extends StatelessWidget {
  final TextEditingController searchController;
  final String searchHint;
  final List<_CatalogListItem> items;
  final String? selectedId;
  final ValueChanged<String> onSelect;
  final VoidCallback onAddCustom;
  final String addLabel;

  const _CatalogList({
    required this.searchController,
    required this.searchHint,
    required this.items,
    required this.selectedId,
    required this.onSelect,
    required this.onAddCustom,
    required this.addLabel,
  });

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;

    return Container(
      decoration: BoxDecoration(border: Border.all(color: semantic.hairline), borderRadius: BorderRadius.circular(AppSpacing.sm)),
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              isDense: true,
              hintText: searchHint,
              prefixIcon: const Icon(PhosphorIconsRegular.magnifyingGlass, size: AppIconSize.dense),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          for (final item in items) _CatalogListRow(item: item, selected: item.id == selectedId, onTap: () => onSelect(item.id)),
          _AddCustomRow(label: addLabel, onTap: onAddCustom),
        ],
      ),
    );
  }
}

class _CatalogListRow extends StatelessWidget {
  final _CatalogListItem item;
  final bool selected;
  final VoidCallback onTap;

  const _CatalogListRow({required this.item, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? scheme.primary.withValues(alpha: 0.1) : Colors.transparent,
          border: Border(left: BorderSide(color: selected ? scheme.primary : Colors.transparent, width: 3)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
        child: Row(
          children: [
            Icon(item.icon, size: AppIconSize.standard, color: selected ? scheme.primary : scheme.onSurface.withValues(alpha: 0.6)),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.name,
                          style: textTheme.bodyLarge?.copyWith(fontWeight: selected ? FontWeight.w600 : FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (item.isCustom) ...[
                        const SizedBox(width: AppSpacing.xs),
                        Icon(PhosphorIconsRegular.sparkle, size: 12, color: semantic.gold),
                      ],
                    ],
                  ),
                  Text(
                    item.subtitle,
                    style: textTheme.bodySmall?.copyWith(color: scheme.onSurface.withValues(alpha: 0.6)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (selected) Icon(PhosphorIconsRegular.checkCircle, color: scheme.primary, size: AppIconSize.standard),
          ],
        ),
      ),
    );
  }
}

class _AddCustomRow extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _AddCustomRow({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
        child: Row(
          children: [
            Icon(PhosphorIconsRegular.plus, size: AppIconSize.dense, color: semantic.gold),
            const SizedBox(width: AppSpacing.sm),
            Text(label, style: textTheme.bodyMedium?.copyWith(color: semantic.gold)),
          ],
        ),
      ),
    );
  }
}

class _EmptyDetailHint extends StatelessWidget {
  final String label;

  const _EmptyDetailHint({required this.label});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 120,
      child: Center(
        child: Text('Scegli $label dalla lista per vedere i dettagli.', style: TextStyle(color: scheme.onSurface.withValues(alpha: 0.5))),
      ),
    );
  }
}

class _ClassDetailPanel extends StatelessWidget {
  final ClassRow classRow;

  const _ClassDetailPanel({required this.classRow});

  @override
  Widget build(BuildContext context) {
    final data = decodeClassData(classRow.dataJson);
    final textTheme = Theme.of(context).textTheme;
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('CLASSE SELEZIONATA', style: AppTypography.numberStyle(fontSize: 11, color: semantic.gold)),
        const SizedBox(height: 4),
        Text(classRow.name, style: textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.sm),
        if (classRow.description != null) Text(classRow.description!, style: textTheme.bodyMedium),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            _StatBox(label: 'Dado vita', value: 'd${classRow.hitDie}'),
            _StatBox(label: 'TS competenti', value: data.savingThrows.isEmpty ? '—' : data.savingThrows.join(' ')),
            _StatBox(label: 'Abilità', value: '${data.skillChoices}'),
            if (data.spellcastingFromLevel != null) _StatBox(label: 'Incantesimi da', value: 'liv. ${data.spellcastingFromLevel}'),
          ],
        ),
      ],
    );
  }
}

class _RaceDetailPanel extends StatelessWidget {
  final RaceRow raceRow;

  const _RaceDetailPanel({required this.raceRow});

  @override
  Widget build(BuildContext context) {
    final data = decodeRaceData(raceRow.dataJson);
    final textTheme = Theme.of(context).textTheme;
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RAZZA SELEZIONATA', style: AppTypography.numberStyle(fontSize: 11, color: semantic.gold)),
        const SizedBox(height: 4),
        Text(raceRow.name, style: textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.sm),
        if (raceRow.description != null) Text(raceRow.description!, style: textTheme.bodyMedium),
        const SizedBox(height: AppSpacing.md),
        if (data.abilityBonuses.isEmpty)
          Text('Nessun bonus di caratteristica.', style: textTheme.bodySmall?.copyWith(color: semantic.hairline))
        else
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [for (final e in data.abilityBonuses.entries) _StatBox(label: e.key, value: '+${e.value}')],
          ),
      ],
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final scheme = Theme.of(context).colorScheme;

    return Container(
      constraints: const BoxConstraints(minWidth: 96),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
      decoration: BoxDecoration(border: Border.all(color: semantic.hairline), borderRadius: BorderRadius.circular(AppSpacing.xs)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label.toUpperCase(), style: AppTypography.numberStyle(fontSize: 10, color: scheme.onSurface.withValues(alpha: 0.6))),
          Text(value, style: textStyleValue(scheme)),
        ],
      ),
    );
  }

  TextStyle textStyleValue(ColorScheme scheme) => AppTypography.numberStyle(fontSize: 16, fontWeight: FontWeight.w600, color: scheme.onSurface);
}

class _SynergyAndNextPanel extends StatelessWidget {
  final ClassRow classRow;
  final RaceRow raceRow;
  final bool isWide;

  const _SynergyAndNextPanel({required this.classRow, required this.raceRow, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final synergy = computeRaceClassSynergy(classRow: classRow, raceRow: raceRow);
    final next = whatsNextHints(decodeClassData(classRow.dataJson));

    final synergyColumn = _SynergyColumn(title: 'SINERGIA CON ${raceRow.name.toUpperCase()}', points: synergy);
    final nextColumn = _NextStepsColumn(title: 'COSA DECIDERAI DOPO', hints: next);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Expanded(child: synergyColumn), const SizedBox(width: AppSpacing.lg), Expanded(child: nextColumn)],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [synergyColumn, const SizedBox(height: AppSpacing.md), nextColumn],
              ),
      ),
    );
  }
}

class _SynergyColumn extends StatelessWidget {
  final String title;
  final List<SynergyPoint> points;

  const _SynergyColumn({required this.title, required this.points});

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.numberStyle(fontSize: 11, color: semantic.gold)),
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
    );
  }
}

class _NextStepsColumn extends StatelessWidget {
  final String title;
  final List<String> hints;

  const _NextStepsColumn({required this.title, required this.hints});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.numberStyle(fontSize: 11, color: scheme.onSurface.withValues(alpha: 0.6))),
        const SizedBox(height: AppSpacing.sm),
        for (final h in hints)
          Padding(padding: const EdgeInsets.only(bottom: AppSpacing.xs), child: Text(h, style: textTheme.bodyMedium)),
      ],
    );
  }
}
