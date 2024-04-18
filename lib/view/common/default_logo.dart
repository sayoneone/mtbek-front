import 'package:flutter/material.dart';

class DefaultLogo extends StatelessWidget {
  const DefaultLogo({
    super.key,
    required this.width,
  });

  final int width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      child: Image.asset(
        'assets/images/logo4x.png',
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
