import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtbek_front/view/app/bloc/user_bloc/user_bloc.dart';
import 'package:mtbek_front/view/common/default_text_loading_animation.dart';
import 'package:mtbek_front/view/app/routing/layout/desktop/components/navigation_desktop_app_bar_create_request_button.dart';
import 'package:mtbek_front/view/app/routing/layout/desktop/components/navigation_desktop_app_bar_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationDesktopAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NavigationDesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        children: [
          const Spacer(),
          const SizedBox(width: 10),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                return NavigationDesktopAppBarItemButton(
                  icon: 'assets/icons/navigation/profile.svg',
                  title: getIt<UserBloc>().user?.name,
                  onTap: () => getIt<AuthBloc>().add(LoggedOut()),
                );
              } else {
                return const DefaultextLoadingAnimation(
                  width: 120,
                  height: 40,
                );
              }
            },
          ),
          const SizedBox(width: 10),
          NavigationDesktopAppBarItemButton(
            icon: 'assets/icons/navigation/phone.svg',
            onTap: () {},
          ),
          const SizedBox(width: 10),
          NavigationDesktopAppBarItemButton(
            icon: 'assets/icons/navigation/notification.svg',
            onTap: () {},
          ),
          const SizedBox(width: 20),
          const NavigationDesktopAppBarCreateOrderButton(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
