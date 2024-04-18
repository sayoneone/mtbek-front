import 'package:mtbek_front/view/app/routing/layout/mobile/drawer/navigation_mobile_drawer_view.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body, this.appBar});
  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: body,
      appBar: appBar,
      drawer: const NavigationMobileDrawerView(),
    );
  }
}
