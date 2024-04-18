import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              children: [
                MaterialButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  child: const Icon(
                    Icons.menu,
                    color: DefaultColors.grey700,
                  ),
                ),
                Text(title),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
