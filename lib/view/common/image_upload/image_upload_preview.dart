import 'dart:io';

import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpladPreview extends StatelessWidget {
  const ImageUpladPreview({
    super.key,
    required this.image,
    required this.onImageRemove,
  });

  final XFile image;
  final Function() onImageRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 120,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: DefaultColors.black,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: kIsWeb
                ? Image.network(
                    image.path,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(
                      image.path,
                    ),
                    fit: BoxFit.cover,
                  ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => onImageRemove(),
              child: Container(
                width: 25,
                height: 25,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:
                      Theme.of(context).scaffoldBackgroundColor.withAlpha(180),
                ),
                child: Icon(
                  Icons.close,
                  color: DefaultColors.black.withAlpha(100),
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
