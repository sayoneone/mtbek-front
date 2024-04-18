import 'package:mtbek_front/view/auth/login/layout/desktop/login_desktop_content_view.dart';
import 'package:mtbek_front/view/common/adaptive_side_image_view.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';

class LoginDesktopView extends StatelessWidget {
  const LoginDesktopView({
    super.key,
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
                // AdaptiveSideImageView(
                //   imagePath: 'assets/images/person_auth_car.webp',
                //   enviromentWidth: constraints.maxWidth,
                //   objectWidth: constraints.maxWidth / 2,
                // ),
                const Flexible(
                  child: LoginDesktopContentView(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
