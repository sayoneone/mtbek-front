import 'package:mtbek_front/view/common/image_upload/image_upload_source_select_view.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadAdd extends StatelessWidget {
  const ImageUploadAdd({
    super.key,
    required this.onImageAdd,
  });
  final Function(XFile) onImageAdd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final image = await showDialog(
          context: context,
          builder: (context) => const ImageUploadSourceSelectView(),
        );
        if (image != null) {
          onImageAdd(image);
        }
      },
      child: Container(
        width: 105,
        height: 120,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: DefaultColors.greenBGLight,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 10),
              Text(
                'Добавить\nфото',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
