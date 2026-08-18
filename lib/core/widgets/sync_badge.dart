import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../theme/theme.dart';

enum SyncState { synced, localOnly }

/// Shown on every entity that isn't synced to a campaign: a check-circle
/// in [AppSemanticColors.ok] when synced, a cloud-slash in
/// [AppSemanticColors.warning] when it's local-only. Offline-first means
/// "local" is the normal, expected state — this is informational, not an
/// error.
class SyncBadge extends StatelessWidget {
  final SyncState state;

  const SyncBadge({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final isSynced = state == SyncState.synced;
    final color = isSynced ? semantic.ok : semantic.warning;

    return Tooltip(
      message: isSynced
          ? 'Sincronizzato con la campagna.'
          : 'Solo su questo dispositivo: si sincronizza alla riconnessione.',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSynced ? PhosphorIconsRegular.checkCircle : PhosphorIconsRegular.cloudSlash,
            size: AppIconSize.dense,
            color: color,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            isSynced ? 'sincronizzato' : 'solo locale',
            style: textTheme.labelSmall?.copyWith(color: color, fontFamily: AppTypography.mono),
          ),
        ],
      ),
    );
  }
}
