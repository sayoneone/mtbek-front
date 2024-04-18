import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/app/routing/router_config.dart';
import 'package:mtbek_front/view/common/default_option_select_view.dart';
import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:mtbek_front/view/common/image_upload/image_upload_list.dart';
import 'package:mtbek_front/view/common/default_app_bar.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/screens/cars/create_car/bloc/create_car_bloc.dart';
import 'package:mtbek_front/view/screens/cars/create_car/components/create_car_button.dart';
import 'package:mtbek_front/view/screens/cars/create_car/create_car_inherited.dart';
import 'package:flutter/material.dart';

class CreateCarDesktopView extends StatelessWidget {
  const CreateCarDesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CreateCarInherited inherited = CreateCarInherited.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth / 4,
            vertical: constraints.maxHeight / 8.5,
          ),
          child: Scaffold(
            appBar: DefaultAppBar(
              isLeadingEnabled: false,
              color: DefaultColors.transparent,
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () => router.pop(),
                    icon: const Icon(
                      Icons.close,
                      color: DefaultColors.black,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: DefaultColors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Добавить транспортное средство',
                        style: DefaultextStyles.title
                            .copyWith(color: DefaultColors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DefaultOptionSelectView(
                      onSelect: (v) {
                        CreateCarInherited.of(context).onCarBrandSelect(v);
                      },
                      selectedItem:
                          CreateCarInherited.of(context).selectedCarBrand,
                      items: getIt<CreateCarBloc>().carBrands,
                      label: 'Вид техники',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: DefaultOptionSelectView(
                            onSelect: (v) {
                              CreateCarInherited.of(context)
                                  .onCarBrandSelect(v);
                            },
                            selectedItem:
                                CreateCarInherited.of(context).selectedCarBrand,
                            items: getIt<CreateCarBloc>().carBrands,
                            label: 'Марка',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: DefaultOptionSelectView(
                            onSelect: (v) {
                              CreateCarInherited.of(context)
                                  .onCarBrandSelect(v);
                            },
                            selectedItem:
                                CreateCarInherited.of(context).selectedCarBrand,
                            items: getIt<CreateCarBloc>().carBrands,
                            label: 'Бренд',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: DefaultextField(
                            controller: inherited.yearController,
                            hint: 'Год',
                            isError: inherited.yearController.text.isEmpty,
                            errorText: 'Данное поле обязательно',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: DefaultextField(
                            controller: inherited.numberController,
                            hint: 'Гос. номер',
                            isError: inherited.numberController.text.isEmpty,
                            errorText: 'Данное поле обязательно',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    DefaultextField(
                      controller: inherited.vinController,
                      hint: 'VIN',
                      isError: inherited.vinController.text.isEmpty,
                      errorText: 'Данное поле обязательно',
                    ),
                    const SizedBox(height: 20),
                    ImageUploadList(
                      images: inherited.images ?? [],
                      onImageAdd: inherited.onImageAdd,
                      onImageRemove: inherited.onImageRemove,
                      title: 'nice cock',
                      isMobile: false,
                    ),
                    const SizedBox(height: 20),
                    CreateCarButton(
                      images: inherited.images,
                      number: inherited.numberController.text,
                      selectedCarBrand: inherited.selectedCarBrand,
                      selectedCarModel: inherited.selectedCarModel,
                      selectedCarSubtype: inherited.selectedCarSubtype,
                      selectedCarType: inherited.selectedCarType,
                      selectedBodyType: inherited.selectedBodyType,
                      vin: inherited.vinController.text,
                      year: inherited.yearController.text.isNotEmpty
                          ? int.parse(inherited.yearController.text)
                          : 0,
                      borderRadius: 10,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
