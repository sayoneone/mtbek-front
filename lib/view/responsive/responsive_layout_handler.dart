import 'package:mtbek_front/view/responsive/layout_const.dart';
import 'package:flutter/material.dart';

class ResponsiveLayoutHandler extends StatelessWidget {
  const ResponsiveLayoutHandler({
    super.key,
    required this.mobileView,
    required this.desktopView,
  });
  final Widget mobileView;
  final Widget desktopView;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileWidth
        ? mobileView
        : desktopView;
  }
}
