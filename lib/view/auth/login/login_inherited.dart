import 'package:flutter/material.dart';

class LoginInherited extends InheritedWidget {
  final TextEditingController loginContoller;
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final Function() onPasswordVisibilitySwitch;

  const LoginInherited({
    super.key,
    required this.loginContoller,
    required this.passwordController,
    required this.isPasswordVisible,
    required this.onPasswordVisibilitySwitch,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant LoginInherited oldWidget) => true;

  static LoginInherited? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LoginInherited>());
  }
}
