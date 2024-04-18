import 'package:mtbek_front/view/auth/login/components/login_button.dart';
import 'package:mtbek_front/view/auth/login/components/navigate_registration_button.dart';
import 'package:mtbek_front/view/auth/login/layout/mobile/login_mobile_content_view.dart';
import 'package:mtbek_front/view/auth/login/login_inherited.dart';
import 'package:mtbek_front/view/common/default_app_bar.dart';
import 'package:flutter/material.dart';

class LoginMobileView extends StatelessWidget {
  const LoginMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = LoginInherited.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppBar(
        isLeadingEnabled: false,
        title: 'Вход',
        centerTitle: false,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: LoginMobileContentView(),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginButton(
                loginContoller: inherited.loginContoller,
                passwordController: inherited.passwordController,
              ),
              const SizedBox(height: 20),
              const NavigateRegistrationButton(
                isMobile: true,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
