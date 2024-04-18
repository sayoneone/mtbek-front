import 'package:mtbek_front/view/auth/login/components/navigate_forgot_password_button.dart';
import 'package:mtbek_front/view/auth/login/login_inherited.dart';
import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:flutter/material.dart';

class LoginMobileContentView extends StatelessWidget {
  const LoginMobileContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginInherited? inherited = LoginInherited.of(context);
    return Column(
      children: [
        DefaultextField(
          controller: inherited!.loginContoller,
          hint: 'Телефон или почта',
          isError: false,
          errorText: '',
        ),
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.bottomRight,
          child: NavigateForgotPasswordButton(
            isMobile: true,
          ),
        ),
        const SizedBox(height: 5),
        DefaultextField(
          isPassword: true,
          passwordVisibilityCallback: () =>
              inherited.onPasswordVisibilitySwitch(),
          controller: inherited.passwordController,
          passwordHidden: !inherited.isPasswordVisible,
          hint: 'Пароль',
          isError: false,
          errorText: '',
        ),
      ],
    );
  }
}
