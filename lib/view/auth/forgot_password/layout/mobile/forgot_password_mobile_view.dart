import 'package:mtbek_front/view/auth/forgot_password/components/forgot_password_button.dart';
import 'package:mtbek_front/view/auth/forgot_password/layout/mobile/forgot_password_mobile_content_view.dart';
import 'package:mtbek_front/view/common/default_app_bar.dart';
import 'package:flutter/material.dart';

class ForgotPasswordMobileView extends StatelessWidget {
  final TextEditingController loginContoller;

  const ForgotPasswordMobileView({
    super.key,
    required this.loginContoller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        isLeadingEnabled: true,
        title: 'Восстановление пароля',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: ForgotPasswordMobileContentView(
          loginContoller: loginContoller,
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              ForgotPasswordButton(
                loginContoller: loginContoller,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
