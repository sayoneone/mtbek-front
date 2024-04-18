import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/auth/forgot_password/layout/desktop/forgot_password_desktop_view.dart';
import 'package:mtbek_front/view/auth/forgot_password/layout/mobile/forgot_password_mobile_view.dart';
import 'package:mtbek_front/view/auth/login/bloc/login_bloc.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:mtbek_front/view/responsive/responsive_layout_handler.dart';
import 'package:mtbek_front/view/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../utils/navigable.dart';

class ForgotPasswordScreen extends StatefulWidget implements Navigable {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();

  @override
  String getName() => Routes.forgotPassword;
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController loginContoller = TextEditingController();

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
            return ResponsiveLayoutHandler(
              mobileView: ForgotPasswordMobileView(
                loginContoller: loginContoller,
              ),
              desktopView: ForgotPasswordDesktopView(
                loginContoller: loginContoller,
              ),
            );
          },
        ),
      ),
    );
  }
}
