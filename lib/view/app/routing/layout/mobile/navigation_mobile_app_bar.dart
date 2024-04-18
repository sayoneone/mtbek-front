import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';

class NavigationMobileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NavigationMobileAppBar({
    super.key,
    this.title,
    this.bottom,
  });
  final Widget? bottom;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DefaultColors.milkBG,
      elevation: 0,
      leading: MaterialButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        child: const Icon(
          Icons.menu,
        ),
      ),
      title: Text(
        title ?? '',
      ),
      flexibleSpace: bottom,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
