import 'package:mtbek_front/view/app/routing/router_config.dart';
import 'package:mtbek_front/view/utils/routes.dart';
import 'package:flutter/material.dart';

class NavigateForgotPasswordButton extends StatelessWidget {
  const NavigateForgotPasswordButton({
    super.key,
    required this.isMobile,
  });
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => router.pushNamed(
        Routes.forgotPassword,
      ),
      child: Text(
        'Забыли пароль?',
        style: TextStyle(
          fontSize: isMobile ? 18 : 16,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
