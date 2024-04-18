// ignore_for_file: use_build_context_synchronously

import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:mtbek_front/domain/usecase/platform/get_camera_image_usecase.dart';
import 'package:mtbek_front/domain/usecase/platform/get_gallery_image_usecase.dart';
import 'package:mtbek_front/view/common/image_upload/image_upload_source_select_item_view.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:flutter/material.dart';

class ImageUploadSourceSelectView extends StatelessWidget {
  const ImageUploadSourceSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Источник изображения',
                style: DefaultextStyles.title.copyWith(
                  color: DefaultColors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 20),
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                minWidth: 0,
                child: const Icon(Icons.close),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageUploadSourceSelectItemView(
                  onTap: () async {
                    try {
                      final image = await getIt<GetGalleryImageUseCase>().call(
                        NoParams(),
                      );
                      if (image != null) {
                        Navigator.pop(context, image);
                      }
                    } catch (err) {
                      DefaultErrorView.call(
                        message: err.toString(),
                      );
                    }
                  },
                  image: const Icon(Icons.photo),
                  title: "Галерея",
                ),
                const Spacer(),
                ImageUploadSourceSelectItemView(
                  onTap: () async {
                    try {
                      final image = await getIt<GetCameraImageUseCase>().call(
                        NoParams(),
                      );
                      if (image != null) {
                        Navigator.pop(context, image);
                      }
                    } catch (err) {
                      if (err.toString().contains(
                            'This implementation of ImagePickerPlatform requires a "cameraDelegate" in order to use ImageSource.camera',
                          )) {}

                      DefaultErrorView.call(
                        message: 'Камера не обнаружена',
                      );
                    }
                  },
                  image: const Icon(Icons.camera),
                  title: "Камера",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
