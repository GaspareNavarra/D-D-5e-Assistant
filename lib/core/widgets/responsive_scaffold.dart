import 'package:flutter/material.dart';

import '../theme/theme.dart';

enum AppBreakpoint {
  /// <600px: single column, bottom [NavigationBar].
  compact,

  /// 600–1100px: compact icon-only [NavigationRail], content can use 2
  /// columns (e.g. list + always-visible detail, not push/pop).
  medium,

  /// >=1100px: [NavigationRail] + room for 3-4 columns side by side.
  /// This should *reveal additional panels*, not just stretch what's on
  /// phone — e.g. a filters column that doesn't exist below this width.
  expanded,
}

AppBreakpoint appBreakpointOf(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width >= AppDimens.breakpointMedium) return AppBreakpoint.expanded;
  if (width >= AppDimens.breakpointCompact) return AppBreakpoint.medium;
  return AppBreakpoint.compact;
}

class AppNavDestination {
  final IconData icon;
  final IconData? selectedIcon;
  final String label;

  const AppNavDestination({required this.icon, this.selectedIcon, required this.label});
}

/// Chrome-only responsive shell shared by every top-level screen: a
/// bottom [NavigationBar] on phone widths, a 56px icon-only
/// [NavigationRail] from tablet width up. The screen body itself comes
/// from [builder], which receives the current [AppBreakpoint] so each
/// screen decides its own column layout — see [AppBreakpoint.expanded].
class ResponsiveScaffold extends StatelessWidget {
  final List<AppNavDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget Function(BuildContext context, AppBreakpoint breakpoint) builder;

  /// Docked under the body, above the nav bar on phone (e.g.
  /// [AiAssistantBar]).
  final Widget? bottomBar;
  final PreferredSizeWidget? appBar;

  const ResponsiveScaffold({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.builder,
    this.bottomBar,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    final breakpoint = appBreakpointOf(context);

    if (breakpoint == AppBreakpoint.compact) {
      return Scaffold(
        appBar: appBar,
        body: builder(context, breakpoint),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ?bottomBar,
            NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              destinations: [
                for (final d in destinations)
                  NavigationDestination(icon: Icon(d.icon), selectedIcon: Icon(d.selectedIcon ?? d.icon), label: d.label),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.none,
            minWidth: 56,
            destinations: [
              for (final d in destinations)
                NavigationRailDestination(icon: Icon(d.icon), selectedIcon: Icon(d.selectedIcon ?? d.icon), label: Text(d.label)),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Column(
              children: [Expanded(child: builder(context, breakpoint)), ?bottomBar],
            ),
          ),
        ],
      ),
    );
  }
}
