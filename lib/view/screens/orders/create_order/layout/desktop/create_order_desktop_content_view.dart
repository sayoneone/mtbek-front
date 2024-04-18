import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/view/common/image_upload/image_upload_list.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_option_select_view.dart';
import 'package:mtbek_front/view/common/default_switch_view.dart';
import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:mtbek_front/view/common/default_text_loading_animation.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:mtbek_front/view/screens/orders/create_order/components/create_order_button.dart';
import 'package:mtbek_front/view/screens/orders/create_order/create_order_inherited.dart';
import 'package:flutter/material.dart';

class CreateOrderDesktopContentView extends StatelessWidget {
  const CreateOrderDesktopContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = CreateOrderInherited.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 10, 35, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Создание заявки',
            style: DefaultextStyles.title.copyWith(color: DefaultColors.black),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Flexible(
                flex: 10,
                child: inherited.regions.isNotEmpty
                    ? DefaultOptionSelectView(
                        onSelect: (v) => inherited.onRegionSelect(v),
                        selectedItem: inherited.selectedRegion,
                        items: inherited.regions,
                        label: 'Регион',
                      )
                    : const DefaultextLoadingAnimation(
                        height: 50,
                        width: double.infinity,
                      ),
              ),
              const Spacer(flex: 1),
              Flexible(
                flex: 10,
                child: DefaultextField(
                  controller: inherited.addressContoller,
                  hint: 'Адрес',
                  isError: inherited.isAddressError,
                  errorText: 'Данное поле обязательно',
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          inherited.requestTypes.isNotEmpty
              ? DefaultOptionSelectView(
                  onSelect: (v) => inherited.onOrderTypeSelect(v),
                  selectedItem: inherited.selectedOrderType,
                  items: inherited.requestTypes,
                  label: 'Тип заявки',
                )
              : const DefaultextLoadingAnimation(
                  height: 50,
                  width: double.infinity,
                ),
          const SizedBox(height: 20),
          DefaultOptionSelectView(
            onSelect: (v) {
              inherited
                  .onCarSelect(inherited.cars.where((e) => e.id == v.id).first);
            },
            selectedItem: (inherited.selectedCar != null)
                ? DictionaryModel(
                    id: inherited.selectedCar?.id,
                    name: (inherited.selectedCar?.vin?.isNotEmpty ?? false)
                        ? inherited.selectedCar?.vin
                        : 'created in ${inherited.selectedCar?.year}',
                  )
                : const DictionaryModel(
                    id: -1,
                    name: 'Выберите автомобиль',
                  ),
            items: List.generate(
              inherited.cars.length,
              (k) => DictionaryModel(
                id: inherited.cars[k].id,
                name: (inherited.cars[k].vin?.isNotEmpty ?? false)
                    ? inherited.cars[k].vin
                    : 'created in ${inherited.cars[k].year}',
                // name: "1221313",
              ),
            ),
            label: 'Автомобиль',
          ),
          const SizedBox(height: 30),
          DefaultSwitchView(
            value: inherited.isTowTruckRequested,
            title: 'Заказать эвакуатор',
            switchPressed: () => inherited.towTruckSwitchPressed(),
          ),
          const SizedBox(height: 20),
          DefaultextField(
            isLong: true,
            maxLength: 500,
            isNessary: true,
            controller: inherited.problemContoller,
            hint: 'Описание проблемы',
            isError: inherited.isProblemError,
            errorText: 'Данное поле обязательно',
          ),
          ImageUploadList(
            images: inherited.images,
            onImageAdd: inherited.onImageAdd,
            onImageRemove: inherited.onImageRemove,
            title: 'Загружено 1 из 3 фото (необязательно)',
            isMobile: false,
          ),
          const SizedBox(height: 30),
          CreateOrderButton(
            selectedRegion: inherited.selectedRegion,
            address: inherited.problemContoller.text,
            selectedOrderType: inherited.selectedOrderType,
            problem: inherited.problemContoller.text,
            selectedCar: inherited.selectedCar,
            isTowTruckRequested: inherited.isTowTruckRequested,
            images: inherited.images,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
