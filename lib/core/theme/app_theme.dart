import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// Assembles [ThemeData] from the design tokens in this folder.
///
/// This file is pure wiring and should not need to change when the real
/// design tokens arrive — update [AppColors], [AppTypography] or
/// [AppSpacing] instead, and it flows through automatically.
abstract class AppTheme {
  static ThemeData get light => _from(AppColors.light);

  static ThemeData get dark => _from(AppColors.dark);

  static ThemeData _from(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: AppTypography.fontFamily,
    );
  }
}
