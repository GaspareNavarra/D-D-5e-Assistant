import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Assembles [ThemeData] from the tokens in this folder.
///
/// This file is pure wiring: it should not need to change when the
/// tokens are revised — edit [AppColors], [AppTypography] or
/// [AppSpacing]/[AppDimens] instead.
///
/// House style, enforced here so every screen gets it for free:
/// - Elevation is never a shadow/blur — see [AppSemanticColors]: a
///   hairline border plus a slightly tinted background stands in for it.
/// - No gradients, no animated transparency; tap feedback is a flat
///   highlight instead of a ripple splash.
/// - See `core/widgets/buttons.dart` for the primary/secondary/tertiary
///   button widgets — ThemeData alone can't express the mobile/desktop
///   height difference, so that lives there, layered on the shapes set
///   up below.
abstract class AppTheme {
  static ThemeData get light => _build(AppColors.lightScheme, AppSemanticColors.light());

  static ThemeData get dark => _build(AppColors.darkScheme, AppSemanticColors.dark());

  static ThemeData _build(ColorScheme scheme, AppSemanticColors semantic) {
    final textTheme = AppTypography.textTheme(scheme);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.sm),
      side: BorderSide(color: semantic.hairline, width: AppDimens.hairlineWidth),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      textTheme: textTheme,
      fontFamily: AppTypography.body,
      scaffoldBackgroundColor: semantic.background,
      extensions: [semantic],

      // No shadows/blur anywhere — see class doc.
      splashFactory: NoSplash.splashFactory,
      highlightColor: semantic.hairline,
      hoverColor: semantic.hairline.withValues(alpha: semantic.hairline.a * 0.6),

      appBarTheme: AppBarTheme(
        backgroundColor: semantic.background,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.titleLarge,
      ),

      cardTheme: CardThemeData(
        color: semantic.surfaceRaised1,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: shape,
        margin: EdgeInsets.zero,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: semantic.surfaceRaised2,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: shape,
      ),

      dividerTheme: DividerThemeData(color: semantic.hairline, thickness: AppDimens.hairlineWidth, space: 1),

      // Baseline shapes for the outline-only button hierarchy; the
      // primary/secondary/tertiary distinction is drawn explicitly by
      // the widgets in core/widgets/buttons.dart, not by this theme.
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: semantic.hairline, width: AppDimens.hairlineWidth),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.xs)),
          foregroundColor: scheme.onSurface,
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: scheme.primary, textStyle: textTheme.labelLarge),
      ),
      filledButtonTheme: FilledButtonThemeData(
        // No filled buttons in this design language — this only exists
        // so a stray FilledButton() doesn't look broken; prefer the
        // explicit button widgets instead.
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: scheme.primary, width: AppDimens.hairlineWidth),
          foregroundColor: scheme.primary,
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: semantic.hairline, width: AppDimens.hairlineWidth),
        shape: StadiumBorder(side: BorderSide(color: semantic.hairline, width: AppDimens.hairlineWidth)),
        labelStyle: textTheme.labelMedium,
        elevation: 0,
        pressElevation: 0,
        selectedColor: scheme.primary.withValues(alpha: 0.12),
      ),

      tabBarTheme: TabBarThemeData(
        dividerColor: semantic.hairline,
        indicatorColor: scheme.primary,
        labelColor: scheme.onSurface,
        unselectedLabelColor: scheme.onSurface.withValues(alpha: 0.6),
        labelStyle: textTheme.labelLarge,
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: semantic.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        indicatorColor: scheme.primary.withValues(alpha: 0.16),
        labelTextStyle: WidgetStateProperty.all(textTheme.labelSmall),
      ),

      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: semantic.background,
        selectedIconTheme: IconThemeData(color: scheme.primary, size: 20),
        unselectedIconTheme: IconThemeData(color: scheme.onSurface.withValues(alpha: 0.6), size: 20),
        indicatorColor: scheme.primary.withValues(alpha: 0.16),
      ),

      iconTheme: IconThemeData(color: scheme.onSurface, size: 20),

      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.xs),
          borderSide: BorderSide(color: semantic.hairline, width: AppDimens.hairlineWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.xs),
          borderSide: BorderSide(color: semantic.hairline, width: AppDimens.hairlineWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.xs),
          borderSide: BorderSide(color: scheme.primary, width: AppDimens.hairlineWidth),
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(color: scheme.onSurface.withValues(alpha: 0.5)),
      ),
    );
  }
}
