import 'package:flutter/material.dart';

class DesktopFilterView extends StatelessWidget {
  const DesktopFilterView({
    super.key,
    required this.items,
  });

  final Widget items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: 10,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: items,
    );
  }
}
