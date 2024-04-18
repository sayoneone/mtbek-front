import 'package:mtbek_front/view/auth/forgot_password/layout/desktop/forgot_password_desktop_content_view.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/responsive/layout_const.dart';
import 'package:flutter/material.dart';

class ForgotPasswordDesktopView extends StatelessWidget {
  final TextEditingController loginContoller;

  const ForgotPasswordDesktopView({
    super.key,
    required this.loginContoller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.greenBGLight,
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 40,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: double.infinity,
                  width: constraints.maxWidth > tabletWidth
                      ? constraints.maxWidth / 2
                      : 0,
                  margin: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/person_auth_car.webp',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: ForgotPasswordDesktopContentView(
                    loginContoller: loginContoller,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
