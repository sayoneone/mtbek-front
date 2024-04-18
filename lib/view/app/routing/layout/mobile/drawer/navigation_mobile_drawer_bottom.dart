import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationMobileDrawerBottom extends StatelessWidget {
  const NavigationMobileDrawerBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: SvgPicture.asset('assets/icons/drawer/logout_drawer.svg'),
            title: Text(
              'Выход',
              style: DefaultextStyles.body.copyWith(
                color: DefaultColors.red500,
              ),
            ),
            onTap: () => getIt<AuthBloc>().add(LoggedOut()),
          ),
          ListTile(
            dense: true,
            title: const Text('О нас'),
            onTap: () async => await launchUrl(
              Uri.parse(
                'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
              ),
            ),
          ),
          ListTile(
            dense: true,
            title: const Text('Техподдержка'),
            onTap: () async => await launchUrl(
              Uri.parse(
                'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
