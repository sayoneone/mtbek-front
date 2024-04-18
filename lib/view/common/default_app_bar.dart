import 'package:flutter/material.dart';

import 'default_colors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final Color titleColor;
  final Widget? leading;
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool isLeadingEnabled;

  const DefaultAppBar({
    Key? key,
    this.color = Colors.transparent,
    this.titleColor = DefaultColors.black,
    this.leading,
    this.title,
    this.centerTitle = true,
    this.isLeadingEnabled = true,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: color,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      elevation: 0,
      leading: isLeadingEnabled
          ? (leading ??
              (Navigator.canPop(context)
                  ? IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: DefaultColors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  : const SizedBox.shrink()))
          : null,
      title: title == null
          ? null
          : Text(
              title!,
              style: TextStyle(
                color: titleColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
