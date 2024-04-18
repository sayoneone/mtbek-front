import 'package:mtbek_front/view/app/routing/layout/desktop/navigation_desktop_app_bar.dart';
import 'package:mtbek_front/view/app/routing/layout/desktop/navigation_desktop_rail_view.dart';
import 'package:mtbek_front/view/app/routing/root_inherited.dart';
import 'package:mtbek_front/view/responsive/layout_const.dart';
import 'package:mtbek_front/view/responsive/responsive_layout_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootNavigation extends StatelessWidget {
  const RootNavigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RootInherited(
      currentTab: navigationShell.currentIndex,
      onTabSwitch: goBranch,
      child: ResponsiveLayoutHandler(
        desktopView: Scaffold(
          body: Row(
            children: [
              NavigationDesktopRailView(
                isTablet: MediaQuery.of(context).size.width < tabletWidth,
              ),
              Expanded(
                child: Column(
                  children: [
                    const NavigationDesktopAppBar(),
                    Expanded(
                      child: navigationShell,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        mobileView: navigationShell,
      ),
    );
  }
}
