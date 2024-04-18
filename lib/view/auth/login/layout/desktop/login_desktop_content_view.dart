import 'package:mtbek_front/view/auth/login/components/login_button.dart';
import 'package:mtbek_front/view/auth/login/components/navigate_forgot_password_button.dart';
import 'package:mtbek_front/view/auth/login/components/navigate_registration_button.dart';
import 'package:mtbek_front/view/auth/login/login_inherited.dart';
import 'package:mtbek_front/view/common/default_logo.dart';
import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:flutter/material.dart';

class LoginDesktopContentView extends StatelessWidget {
  const LoginDesktopContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = LoginInherited.of(context)!;

    return LayoutBuilder(
      builder: (context, constarains) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: DefaultLogo(width: 50),
              ),
              SizedBox(height: constarains.maxHeight / 15),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constarains.maxWidth / 8,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Вход',
                          style: DefaultextStyles.title,
                        ),
                      ),
                      const SizedBox(height: 30),
                      DefaultextField(
                        controller: inherited.loginContoller,
                        hint: 'Телефон или почта',
                        isError: false,
                        errorText: '',
                      ),
                      const SizedBox(height: 30),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: NavigateForgotPasswordButton(
                          isMobile: false,
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
                      const SizedBox(height: 30),
                      LoginButton(
                        loginContoller: inherited.loginContoller,
                        passwordController: inherited.passwordController,
                      ),
                      const SizedBox(height: 30),
                      const NavigateRegistrationButton(
                        isMobile: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
