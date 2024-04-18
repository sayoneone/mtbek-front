// ignore_for_file: deprecated_member_use

import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationDesktopRailItemView extends StatelessWidget {
  const NavigationDesktopRailItemView({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.isIconOnly,
  });

  final String label;
  final String iconPath;
  final bool isSelected;
  final Function() onTap;
  final bool isIconOnly;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      curve: Curves.ease,
      decoration: BoxDecoration(
        border: isSelected && !isIconOnly
            ? Border(
                right: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 4,
                ),
              )
            : null,
      ),
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          width: double.infinity,
          padding: isIconOnly
              ? const EdgeInsets.symmetric(vertical: 15, horizontal: 10)
              : const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
          decoration: BoxDecoration(
            color: isSelected
                ? DefaultColors.green50
                : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : DefaultColors.grey300,
                width: 20,
              ),
              if (!isIconOnly) const SizedBox(width: 10),
              if (!isIconOnly)
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : DefaultColors.grey300,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.normal,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
