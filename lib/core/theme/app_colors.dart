import 'package:flutter/material.dart';

/// Color tokens for the app.
///
/// PLACEHOLDER VALUES — a plain Material 3 seed color. This file will be
/// replaced wholesale once the real design tokens arrive from Claude
/// Design. Nothing outside `core/theme/` should reference a raw [Color];
/// go through [AppColors.light] / [AppColors.dark] instead, so that swap
/// stays a single-file change.
abstract class AppColors {
  static const Color _seed = Color(0xFF6750A4);

  static final ColorScheme light = ColorScheme.fromSeed(
    seedColor: _seed,
    brightness: Brightness.light,
  );

  static final ColorScheme dark = ColorScheme.fromSeed(
    seedColor: _seed,
    brightness: Brightness.dark,
  );
}
