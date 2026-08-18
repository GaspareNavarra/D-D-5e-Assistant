import 'package:flutter/material.dart';

import '../theme/theme.dart';

/// Thin strip (3px) that tints a card/app bar with the current context:
/// bordeaux for Player, viola for DM. Same component either way — only
/// the color changes, per the brief's "stessa struttura di navigazione e
/// stessi componenti, cambia solo l'accento di colore".
class RoleBar extends StatelessWidget {
  final bool isDm;
  final double? width;

  const RoleBar({super.key, required this.isDm, this.width});

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    return Container(width: width, height: AppDimens.roleBarHeight, color: semantic.roleColor(isDm));
  }
}
