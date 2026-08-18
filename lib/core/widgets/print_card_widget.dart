import 'package:flutter/material.dart';

import '../theme/theme.dart';

/// A single labeled stat in the 2×2 grid (e.g. "LANCIO" / "1 azione").
class PrintCardStat {
  final String label;
  final String value;

  const PrintCardStat({required this.label, required this.value});
}

/// Everything [PrintCardWidget] needs to render a card. Deliberately
/// generic (spells and items both fit) rather than tied to the Drift
/// `SpellRow`/`ItemRow` types, since the cards feature will map either
/// one onto this.
class PrintCardData {
  final String name;

  /// e.g. spell school ("Evocazione") or item type ("Arma").
  final String category;

  /// e.g. "Livello 3" or "Rara".
  final String levelOrRarity;

  /// Up to 4 entries, laid out 2×2 (Lancio/Gittata/Componenti/Durata for
  /// a spell; whatever fits for an item).
  final List<PrintCardStat> stats;

  final String description;

  /// 'official' | 'homebrew' | 'custom' — shown verbatim in the footer.
  final String source;

  const PrintCardData({
    required this.name,
    required this.category,
    required this.levelOrRarity,
    required this.stats,
    required this.description,
    required this.source,
  });
}

/// Print-ready rendering of a spell/item card: physical poker format
/// (63×88mm), pure black on pure white, no shadows/gradients/
/// transparency, bold 2px borders — legible in grayscale on a cheap
/// laser printer. Deliberately ignores `Theme.of(context)` for its
/// colors: this widget looks the same in a light or dark app theme,
/// because what it renders is what comes out of the printer.
///
/// [width] sizes the on-screen preview; the actual physical PDF export
/// (via `pdf`/`printing`) is built by the card-generator feature and
/// reuses [data], not this widget's pixel layout.
class PrintCardWidget extends StatelessWidget {
  final PrintCardData data;
  final double width;

  const PrintCardWidget({super.key, required this.data, this.width = 240});

  static const _black = Colors.black;
  static const _white = Colors.white;

  @override
  Widget build(BuildContext context) {
    final height = width * (AppDimens.printCardHeightMm / AppDimens.printCardWidthMm);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _white,
        border: Border.all(color: _black, width: AppDimens.printCardBorderWidth),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(name: data.name, category: data.category, levelOrRarity: data.levelOrRarity),
          if (data.stats.isNotEmpty) _StatGrid(stats: data.stats),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: SingleChildScrollView(
                child: Text(
                  data.description,
                  style: const TextStyle(fontFamily: AppTypography.body, color: _black, fontSize: 8.5, height: 1.3),
                ),
              ),
            ),
          ),
          _Footer(source: data.source),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String name;
  final String category;
  final String levelOrRarity;

  const _Header({required this.name, required this.category, required this.levelOrRarity});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrintCardWidget._black,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: const TextStyle(fontFamily: AppTypography.display, color: PrintCardWidget._white, fontSize: 15, height: 1.1),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '$category · $levelOrRarity'.toUpperCase(),
            style: const TextStyle(
              fontFamily: AppTypography.mono,
              color: PrintCardWidget._white,
              fontSize: 8,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatGrid extends StatelessWidget {
  final List<PrintCardStat> stats;

  const _StatGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    final cells = stats.take(4).toList();
    return Column(
      children: [
        for (var row = 0; row < cells.length; row += 2)
          Row(children: [for (final stat in cells.skip(row).take(2)) Expanded(child: _StatCell(stat: stat))]),
      ],
    );
  }
}

class _StatCell extends StatelessWidget {
  final PrintCardStat stat;

  const _StatCell({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: PrintCardWidget._black, width: 1),
          bottom: BorderSide(color: PrintCardWidget._black, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            stat.label.toUpperCase(),
            style: const TextStyle(fontFamily: AppTypography.mono, color: PrintCardWidget._black, fontSize: 6.5),
          ),
          Text(
            stat.value,
            style: const TextStyle(
              fontFamily: AppTypography.body,
              color: PrintCardWidget._black,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final String source;

  const _Footer({required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 3),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: PrintCardWidget._black, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            source.toUpperCase(),
            style: const TextStyle(fontFamily: AppTypography.mono, color: PrintCardWidget._black, fontSize: 7),
          ),
          Text(
            '${AppDimens.printCardWidthMm.toInt()}×${AppDimens.printCardHeightMm.toInt()}mm',
            style: const TextStyle(fontFamily: AppTypography.mono, color: PrintCardWidget._black, fontSize: 7),
          ),
        ],
      ),
    );
  }
}
