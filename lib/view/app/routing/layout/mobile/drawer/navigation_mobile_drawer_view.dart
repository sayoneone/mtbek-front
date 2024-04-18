import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/app/bloc/user_bloc/user_bloc.dart';
import 'package:mtbek_front/view/app/routing/layout/mobile/drawer/navigation_mobile_drawer_bottom.dart';
import 'package:mtbek_front/view/app/routing/layout/mobile/drawer/navigation_mobile_drawer_content_view.dart';
import 'package:mtbek_front/view/app/routing/layout/mobile/drawer/navigation_mobile_drawer_header_view.dart';
import 'package:mtbek_front/view/app/routing/layout/mobile/drawer/navigation_mobile_drawer_user_info_view.dart';
import 'package:flutter/material.dart';

class NavigationMobileDrawerView extends StatefulWidget {
  const NavigationMobileDrawerView({super.key});

  @override
  State<NavigationMobileDrawerView> createState() =>
      _NavigationMobileDrawerViewState();
}

class _NavigationMobileDrawerViewState
    extends State<NavigationMobileDrawerView> {
  @override
  void initState() {
    getIt<UserBloc>().add(CurrentUserRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: const Scaffold(
        // bottomNavigationBar: NavigationMobileDrawerBottom(),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavigationMobileDrawerHeaderView(),
              NavigationMobileDrawerUserInfoView(),
              NavigationMobileDrawerContentView(),
              NavigationMobileDrawerBottom()
            ],
          ),
        ),
      ),
    );
  }
}
