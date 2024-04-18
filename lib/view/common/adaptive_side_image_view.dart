import 'package:mtbek_front/view/responsive/layout_const.dart';
import 'package:flutter/material.dart';

class AdaptiveSideImageView extends StatelessWidget {
  const AdaptiveSideImageView({
    super.key,
    required this.imagePath,
    required this.enviromentWidth,
    required this.objectWidth,
  });

  final String imagePath;
  final double enviromentWidth;
  final double objectWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      height: double.infinity,
      width: enviromentWidth > tabletWidth ? objectWidth : 0,
      margin: const EdgeInsets.all(20),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
