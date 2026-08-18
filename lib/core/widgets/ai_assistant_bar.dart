import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../theme/theme.dart';

/// Conversational bar always docked at the bottom of the screen — same
/// component for Player and DM contexts; only the role tint and the
/// suggestion chips underneath change. Stays visible (not hidden) when
/// offline, just disabled, with a tooltip explaining why.
class AiAssistantBar extends StatefulWidget {
  final bool isOnline;
  final bool isDm;
  final String hintText;
  final List<String> suggestionChips;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChipTap;

  const AiAssistantBar({
    super.key,
    required this.isOnline,
    required this.isDm,
    this.hintText = 'Chiedi qualunque cosa: regole, PNG, un nome…',
    this.suggestionChips = const [],
    this.onSubmit,
    this.onChipTap,
  });

  @override
  State<AiAssistantBar> createState() => _AiAssistantBarState();
}

class _AiAssistantBarState extends State<AiAssistantBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSubmit?.call(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;
    final roleColor = semantic.roleColor(widget.isDm);

    return Material(
      color: semantic.background,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.sm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.suggestionChips.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: SizedBox(
                    height: 32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.suggestionChips.length,
                      separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.xs),
                      itemBuilder: (context, i) {
                        final chip = widget.suggestionChips[i];
                        return ActionChip(
                          label: Text(chip),
                          onPressed: widget.isOnline ? () => widget.onChipTap?.call(chip) : null,
                        );
                      },
                    ),
                  ),
                ),
              Tooltip(
                message: widget.isOnline ? '' : "L'assistente richiede una connessione: riprova quando sei online.",
                child: TextField(
                  controller: _controller,
                  enabled: widget.isOnline,
                  onSubmitted: widget.isOnline ? (_) => _submit() : null,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(PhosphorIconsRegular.sparkle, color: roleColor, size: AppIconSize.standard),
                    suffixIcon: widget.isOnline
                        ? IconButton(
                            icon: const Icon(PhosphorIconsRegular.arrowUp, size: AppIconSize.standard),
                            onPressed: _submit,
                          )
                        : Icon(PhosphorIconsRegular.cloudSlash, size: AppIconSize.dense, color: semantic.warning),
                    hintText: widget.hintText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
