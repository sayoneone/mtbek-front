import 'package:mtbek_front/view/app/routing/router_config.dart';
import 'package:mtbek_front/view/utils/routes.dart';
import 'package:flutter/material.dart';

class NavigateLoginButton extends StatelessWidget {
  const NavigateLoginButton({
    super.key,
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        router.pushNamed(
          Routes.login,
        );
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: isMobile
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : null,
        child: Text(
          'Вход',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
