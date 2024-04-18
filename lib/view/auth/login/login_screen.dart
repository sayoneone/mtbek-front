import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/auth/login/bloc/login_bloc.dart';
import 'package:mtbek_front/view/auth/login/layout/desktop/login_desktop_view.dart';
import 'package:mtbek_front/view/auth/login/layout/mobile/login_mobile_view.dart';
import 'package:mtbek_front/view/auth/login/login_inherited.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:mtbek_front/view/responsive/responsive_layout_handler.dart';
import 'package:mtbek_front/view/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../utils/navigable.dart';

class LoginScreen extends StatefulWidget implements Navigable {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  String getName() => Routes.login;
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController loginContoller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: BlocProvider.value(
        value: getIt<LoginBloc>(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              DefaultErrorView.call(
                message: state.message,
              );
            }
          },
          builder: (context, state) {
            return LoginInherited(
              loginContoller: loginContoller,
              passwordController: passwordController,
              isPasswordVisible: isPasswordVisible,
              onPasswordVisibilitySwitch: () => setState(
                () => isPasswordVisible = !isPasswordVisible,
              ),
              child: const ResponsiveLayoutHandler(
                mobileView: LoginMobileView(),
                desktopView: LoginDesktopView(),
              ),
            );
          },
        ),
      ),
    );
  }
}
