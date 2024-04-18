import 'package:mtbek_front/view/app/routing/router_config.dart';
import 'package:mtbek_front/view/utils/navigable.dart';
import 'package:mtbek_front/view/utils/routes.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget implements Navigable {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => router.pop(),
        ),
        title: const Text('Ой!'),
      ),
      body: const Center(
        child: Text('ты ушел куда то не туда или сломал нам приложение'),
      ),
    );
  }

  @override
  String getName() => Routes.pageNotFound;
}
