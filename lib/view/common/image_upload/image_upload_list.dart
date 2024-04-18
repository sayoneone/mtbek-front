import 'package:mtbek_front/view/common/image_upload/image_upload_add.dart';
import 'package:mtbek_front/view/common/image_upload/image_upload_preview.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadList extends StatelessWidget {
  const ImageUploadList({
    super.key,
    required this.images,
    required this.onImageAdd,
    required this.onImageRemove,
    required this.title,
    required this.isMobile,
    this.maxImages = 3,
  });

  final List<XFile?> images;
  final Function(XFile) onImageAdd;
  final Function(XFile) onImageRemove;
  final String title;
  final int maxImages;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              if (images.length < maxImages)
                ImageUploadAdd(
                  onImageAdd: onImageAdd,
                ),
              ...List.generate(
                images.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: ImageUpladPreview(
                      image: images[index]!,
                      onImageRemove: () => onImageRemove(
                        images[index]!,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
