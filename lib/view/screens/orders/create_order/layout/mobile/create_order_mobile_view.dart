import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/view/common/default_app_bar.dart';
import 'package:mtbek_front/view/common/default_option_select_view.dart';
import 'package:mtbek_front/view/common/default_switch_view.dart';
import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:mtbek_front/view/common/default_text_loading_animation.dart';
import 'package:mtbek_front/view/common/image_upload/image_upload_list.dart';
import 'package:mtbek_front/view/common/mobile/app_scaffold.dart';
import 'package:mtbek_front/view/screens/orders/create_order/bloc/create_order_bloc.dart';
import 'package:mtbek_front/view/screens/orders/create_order/components/create_order_button.dart';
import 'package:mtbek_front/view/screens/orders/create_order/create_order_inherited.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrderMobileView extends StatelessWidget {
  const CreateOrderMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = CreateOrderInherited.of(context);
    return AppScaffold(
      appBar: DefaultAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        title: 'Добавить заявку',
      ),
      body: BlocListener<CreateOrderBloc, CreateOrderState>(
        listener: (context, state) {
          if (state is CreateRequestSuccess) {
            Navigator.pop(context);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inherited.regions.isNotEmpty
                  ? DefaultOptionSelectView(
                      onSelect: (v) => inherited.onRegionSelect(v),
                      selectedItem: inherited.selectedRegion,
                      items: inherited.regions,
                      label: 'Город',
                    )
                  : const DefaultextLoadingAnimation(
                      height: 50,
                      width: double.infinity,
                    ),
              const SizedBox(height: 30),
              DefaultextField(
                controller: inherited.addressContoller,
                hint: 'Район',
                isError: inherited.isAddressError,
                errorText: 'Данное поле обязательно',
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
              const SizedBox(height: 30),
              DefaultOptionSelectView(
                onSelect: (v) {
                  inherited.onCarSelect(
                      inherited.cars.where((e) => e.id == v.id).first);
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
                        name: 'Выберите ваш автомобиль',
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
                address: inherited.addressContoller.text,
                selectedOrderType: inherited.selectedOrderType,
                problem: inherited.problemContoller.text,
                selectedCar: inherited.selectedCar,
                isTowTruckRequested: inherited.isTowTruckRequested,
                images: inherited.images,
                borderRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
