import 'package:mtbek_front/view/common/default_logo.dart';
import 'package:mtbek_front/view/app/routing/layout/desktop/navigation_desktop_rail_item_view.dart';
import 'package:mtbek_front/view/app/routing/root_inherited.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDesktopRailView extends StatelessWidget {
  const NavigationDesktopRailView({
    super.key,
    required this.isTablet,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final RootInherited inherited = RootInherited.of(context);
    return AnimatedContainer(
      height: double.infinity,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      padding: const EdgeInsets.only(left: 10, right: 1),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          right: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.5,
          ),
        ),
      ),
      width: isTablet ? 70 : 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: isTablet ? 5 : 60),
                  child: const DefaultLogo(width: 0),
                ),
                const SizedBox(height: 20),
                NavigationDesktopRailItemView(
                  iconPath: 'assets/icons/navigation/bookmark.svg',
                  label: 'Мои заявки',
                  isSelected: inherited.currentTab == 0,
                  onTap: () => inherited.onTabSwitch(0),
                  isIconOnly: isTablet,
                ),
                NavigationDesktopRailItemView(
                  iconPath: 'assets/icons/navigation/car.svg',
                  label: 'Мои машины',
                  isSelected: inherited.currentTab == 1,
                  onTap: () => inherited.onTabSwitch(1),
                  isIconOnly: isTablet,
                ),
                NavigationDesktopRailItemView(
                  iconPath: 'assets/icons/navigation/manager.svg',
                  label: 'Мои менеджеры',
                  isSelected: inherited.currentTab == 2,
                  onTap: () => inherited.onTabSwitch(2),
                  isIconOnly: isTablet,
                ),
                NavigationDesktopRailItemView(
                  iconPath: 'assets/icons/navigation/service.svg',
                  label: 'Автосервисы',
                  isSelected: inherited.currentTab == 3,
                  onTap: () => inherited.onTabSwitch(3),
                  isIconOnly: isTablet,
                ),
                NavigationDesktopRailItemView(
                  iconPath: 'assets/icons/navigation/shop.svg',
                  label: 'Автозапчасти',
                  isSelected: inherited.currentTab == 4,
                  onTap: () => inherited.onTabSwitch(4),
                  isIconOnly: isTablet,
                ),
              ],
            ),
          ),
          if (!isTablet)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async => await launchUrl(
                    Uri.parse(
                      'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                    ),
                    mode: LaunchMode.externalApplication,
                  ),
                  child: const Text('О нас'),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async => await launchUrl(
                    Uri.parse(
                      'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                    ),
                    mode: LaunchMode.externalApplication,
                  ),
                  child: const Text('Техподдержка'),
                ),
                const SizedBox(height: 10),
              ],
            ),
        ],
      ),
    );

    // return NavigationRail(
    //   leading: const DefaultLogo(
    //     width: 50,
    //   ),
    //   extended: !isTablet,
    //   useIndicator: true,
    //   onDestinationSelected: (v) => switchTab(v),
    //   destinations: [
    //     NavigationRailDestination(
    //       indicatorColor: DefaultColors.red500,
    //       indicatorShape: Border.all(
    //         color: DefaultColors.red500,
    //         width: 2,
    //       ),
    //       icon: SvgPicture.asset(
    //         'assets/icons/navigation/bookmark.svg',
    //       ),
    //       selectedIcon: SvgPicture.asset(
    //         'assets/icons/navigation/bookmark.svg',
    //         color: Theme.of(context).primaryColor,
    //       ),
    //       label: const Text('Мои заявки'),
    //     ),
    //     NavigationRailDestination(
    //       icon: SvgPicture.asset('assets/icons/navigation/car.svg'),
    //       selectedIcon: SvgPicture.asset(
    //         'assets/icons/navigation/car.svg',
    //         color: Theme.of(context).primaryColor,
    //       ),
    //       label: const Text('Мои машины'),
    //     ),
    //     NavigationRailDestination(
    //       icon: SvgPicture.asset('assets/icons/navigation/manager.svg'),
    //       selectedIcon: SvgPicture.asset(
    //         'assets/icons/navigation/manager.svg',
    //         color: Theme.of(context).primaryColor,
    //       ),
    //       label: const Text('Мои менеджеры'),
    //     ),
    //     NavigationRailDestination(
    //       icon: SvgPicture.asset('assets/icons/navigation/service.svg'),
    //       selectedIcon: SvgPicture.asset(
    //         'assets/icons/navigation/service.svg',
    //         color: Theme.of(context).primaryColor,
    //       ),
    //       label: const Text('Автосервисы'),
    //     ),
    //     NavigationRailDestination(
    //       icon: SvgPicture.asset('assets/icons/navigation/shop.svg'),
    //       selectedIcon: SvgPicture.asset(
    //         'assets/icons/navigation/shop.svg',
    //         color: Theme.of(context).primaryColor,
    //       ),
    //       label: const Text('Автозапчасти'),
    //     ),
    //     NavigationRailDestination(
    //       icon: SvgPicture.asset('assets/icons/navigation/car_fix.svg'),
    //       selectedIcon: SvgPicture.asset(
    //         'assets/icons/navigation/car_fix.svg',
    //         color: Theme.of(context).primaryColor,
    //       ),
    //       label: const Text('Эвакуаторы'),
    //     ),
    //   ],
    //   selectedIndex: currentTab,
    // );
  }
}
