import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class DefaultextLoadingAnimation extends StatelessWidget {
  final double width;
  final double height;
  const DefaultextLoadingAnimation({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      shimmerColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
