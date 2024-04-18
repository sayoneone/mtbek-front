import 'package:mtbek_front/view/auth/forgot_password/components/forgot_password_button.dart';
import 'package:mtbek_front/view/common/default_back_button.dart';
import 'package:mtbek_front/view/common/default_logo.dart';
import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordDesktopContentView extends StatelessWidget {
  final TextEditingController loginContoller;
  const ForgotPasswordDesktopContentView({
    super.key,
    required this.loginContoller,
  });

  @override
  Widget build(BuildContext context) {
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
                        child: Row(
                          children: [
                            const DefaultBackButton(),
                            Text(
                              'Восстановление пароля',
                              style: DefaultextStyles.title,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      DefaultextField(
                        controller: loginContoller,
                        hint: 'Телефон или почта',
                        isError: false,
                        errorText: '',
                      ),
                      const SizedBox(height: 30),
                      ForgotPasswordButton(
                        loginContoller: loginContoller,
                      ),
                      const SizedBox(height: 30),
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
