import 'package:mtbek_front/view/common/image_upload/image_upload_list.dart';
import 'package:mtbek_front/view/common/mobile/app_scaffold.dart';
import 'package:mtbek_front/view/screens/cars/create_car/create_car_inherited.dart';
import 'package:flutter/material.dart';

class CreateCarMobileView extends StatelessWidget {
  const CreateCarMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CreateCarInherited? inherited = CreateCarInherited.of(context);

    return AppScaffold(
      body: Column(
        children: [
          TextField(
            controller: CreateCarInherited.of(context)?.vinController,
          ),
          ImageUploadList(
            images: inherited?.images ?? [],
            onImageAdd: inherited?.onImageAdd ?? (v) {},
            onImageRemove: inherited?.onImageRemove ?? (v) {},
            title: 'nice mobile cock',
            isMobile: true,
          )
        ],
      ),
    );
  }
}
