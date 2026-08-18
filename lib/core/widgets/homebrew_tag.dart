import 'package:flutter/material.dart';

import '../theme/theme.dart';

/// Outline badge in gold reading "homebrew" — flags a spell/item/NPC that
/// isn't from the official SRD.
class HomebrewTag extends StatelessWidget {
  const HomebrewTag({super.key});

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: semantic.gold, width: AppDimens.hairlineWidth),
        borderRadius: BorderRadius.circular(AppSpacing.xs),
      ),
      child: Text(
        'homebrew',
        style: textTheme.labelSmall?.copyWith(color: semantic.gold, fontFamily: AppTypography.mono),
      ),
    );
  }
}
