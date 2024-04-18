import 'package:mtbek_front/view/auth/registration/layout/desktop/registration_desktop_content_view.dart';
import 'package:mtbek_front/view/auth/registration/registration_inherited.dart';
import 'package:mtbek_front/view/common/adaptive_side_image_view.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';

class RegistrationDesktopView extends StatelessWidget {
  const RegistrationDesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = RegistrationInherited.of(context);
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
                AdaptiveSideImageView(
                  imagePath: inherited.isBusiness
                      ? 'assets/images/entity_auth_car.webp'
                      : 'assets/images/person_auth_car.webp',
                  enviromentWidth: constraints.maxWidth,
                  objectWidth: constraints.maxWidth / 2,
                ),
                const Flexible(
                  child: RegistrationDesktopContentView(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
