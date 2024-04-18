import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationDesktopAppBarItemButton extends StatelessWidget {
  const NavigationDesktopAppBarItemButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.title,
  });

  final String icon;
  final Function() onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: title == null
          ? Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                icon,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      icon,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title!,
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
    );
  }
}
