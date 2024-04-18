import 'package:mtbek_front/view/app/routing/layout/mobile/drawer/navigation_mobile_drawer_create_order_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationMobileDrawerContentView extends StatelessWidget {
  const NavigationMobileDrawerContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: SvgPicture.asset('assets/icons/drawer/profile_drawer.svg'),
          title: const Text('Личные данные'),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/drawer/payment_drawer.svg'),
          title: const Text('Мои карты'),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/drawer/list_drawer.svg'),
          title: const Text('Мои счета'),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/drawer/eye_drawer.svg'),
          title: const Text('Смена пароля'),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(
              'assets/icons/drawer/notification_warn_drawer.svg'),
          title: const Text('Мои уведомления'),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset(
              'assets/icons/drawer/notification_normal_drawer.svg'),
          title: const Text('Настройка уведомлений'),
          onTap: () {},
        ),
        const SizedBox(height: 20),
        const NavigationMobileDrawerCreateOrderButton(),
      ],
    );
  }
}
