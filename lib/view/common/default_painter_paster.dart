import 'package:flutter/material.dart';

class DefaultPainterPaster extends StatelessWidget {
  final CustomPainter painter;

  const DefaultPainterPaster({
    Key? key,
    required this.painter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(28.0, 28.0),
      painter: painter,
    );
  }
}
