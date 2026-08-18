import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/theme.dart';

enum SpellSlotState {
  /// Filled diamond: slot is available to spend.
  available,

  /// Diagonal-hatched diamond: slot has been spent this rest.
  spent,

  /// Outline-only diamond: a temporary/bonus slot.
  temporary,
}

/// A single spell slot, drawn as a 45°-rotated diamond (14-15px visible
/// mark) with a full 44px tap target regardless. Tap spends the slot,
/// long-press recovers it — both wired by the caller via [onSpend] /
/// [onRecover], since only the character-sheet feature knows how to
/// persist that.
class SpellSlotPip extends StatelessWidget {
  final SpellSlotState state;
  final VoidCallback? onSpend;
  final VoidCallback? onRecover;

  const SpellSlotPip({super.key, required this.state, this.onSpend, this.onRecover});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;

    final label = switch (state) {
      SpellSlotState.available => 'Slot disponibile. Tocca per spenderlo.',
      SpellSlotState.spent => 'Slot speso. Tieni premuto per recuperarlo.',
      SpellSlotState.temporary => 'Slot temporaneo.',
    };

    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: onSpend,
        onLongPress: onRecover,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: AppDimens.minTapTarget,
          height: AppDimens.minTapTarget,
          child: Center(
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                width: AppDimens.spellSlotPipSize,
                height: AppDimens.spellSlotPipSize,
                decoration: BoxDecoration(
                  color: state == SpellSlotState.available ? color : Colors.transparent,
                  border: Border.all(color: state == SpellSlotState.temporary ? semantic.hairline : color, width: 1.5),
                ),
                child: state == SpellSlotState.spent ? CustomPaint(painter: _HatchPainter(color: color)) : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HatchPainter extends CustomPainter {
  final Color color;
  const _HatchPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5;
    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant _HatchPainter oldDelegate) => oldDelegate.color != color;
}
