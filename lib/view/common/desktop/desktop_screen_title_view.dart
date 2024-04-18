import 'package:flutter/material.dart';

class DesktopScreenTitleView extends StatelessWidget {
  const DesktopScreenTitleView({
    super.key,
    required this.title,
    this.itemCount,
    this.trailing,
  });

  final String title;
  final int? itemCount;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (itemCount != null)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '($itemCount)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        const Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}
