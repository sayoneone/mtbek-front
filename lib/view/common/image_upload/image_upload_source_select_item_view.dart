import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';

class ImageUploadSourceSelectItemView extends StatelessWidget {
  const ImageUploadSourceSelectItemView({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });

  final Function() onTap;
  final String title;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: DefaultColors.transparent,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            image,
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
