import 'package:mtbek_front/view/auth/registration/components/navigate_login_button.dart';
import 'package:mtbek_front/view/auth/registration/components/registration_button.dart';
import 'package:mtbek_front/view/auth/registration/layout/mobile/registration_mobile_content_view.dart';
import 'package:mtbek_front/view/auth/registration/registration_inherited.dart';
import 'package:mtbek_front/view/common/default_app_bar.dart';
import 'package:flutter/material.dart';

class RegistrationMobileView extends StatelessWidget {
  const RegistrationMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = RegistrationInherited.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppBar(
        isLeadingEnabled: false,
        title: 'Регистрация',
        centerTitle: false,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: RegistrationMobileContentView(),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RegistrationButton(
                companyName: inherited.companyNameController,
                name: inherited.nameController,
                email: inherited.emailController,
                phone: inherited.phoneContoller,
                password: inherited.passwordController,
                region: inherited.selectedRegion,
                isBusiness: inherited.isBusiness,
                isPolicyAccepted: inherited.isPolicyAccepted,
              ),
              const SizedBox(height: 20),
              const NavigateLoginButton(
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
