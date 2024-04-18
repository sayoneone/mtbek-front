import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';

class NavigationMobileDrawerHeaderView extends StatelessWidget {
  const NavigationMobileDrawerHeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 70, bottom: 20),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      color: DefaultColors.green50,
      child: Image.asset(
        'assets/images/logo4x.png',
        height: 70,
      ),
    );
  }
}
