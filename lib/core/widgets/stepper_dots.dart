import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../theme/theme.dart';

enum StepState { done, current, pending }

/// Multi-step wizard progress indicator: numbered circles connected by
/// lines, done steps show a check mark in [AppSemanticColors.ok], the
/// current step is outlined in the accent color, pending steps are
/// hairline-only.
class StepperDots extends StatelessWidget {
  final int stepCount;

  /// 0-based index of the step currently being edited.
  final int currentIndex;

  const StepperDots({super.key, required this.stepCount, required this.currentIndex});

  StepState _stateFor(int i) {
    if (i < currentIndex) return StepState.done;
    if (i == currentIndex) return StepState.current;
    return StepState.pending;
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;

    Color colorFor(StepState state) => switch (state) {
      StepState.done => semantic.ok,
      StepState.current => scheme.primary,
      StepState.pending => semantic.hairline,
    };

    Widget dot(int i) {
      final state = _stateFor(i);
      final color = colorFor(state);
      return Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: color, width: 1.5)),
        child: state == StepState.done
            ? Icon(PhosphorIconsRegular.check, size: 14, color: color)
            : Text('${i + 1}', style: AppTypography.numberStyle(fontSize: 13, color: color)),
      );
    }

    Widget connector(int i) {
      final done = i < currentIndex;
      return Expanded(child: Container(height: 1.5, color: done ? semantic.ok : semantic.hairline));
    }

    final children = <Widget>[];
    for (var i = 0; i < stepCount; i++) {
      children.add(dot(i));
      if (i != stepCount - 1) children.add(connector(i));
    }

    return Row(children: children);
  }
}
