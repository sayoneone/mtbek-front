import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/domain/model/order_model.dart';
import 'package:mtbek_front/view/app/routing/layout/mobile/navigation_mobile_app_bar.dart';
import 'package:mtbek_front/view/common/mobile/app_scaffold.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:mtbek_front/view/common/mobile/default_date_range_picker_view.dart';
import 'package:mtbek_front/view/common/mobile/mobile_default_option_select_view.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/bloc/my_orders_bloc.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/components/no_orders_view.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/layout/mobile/components/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderMobileView extends StatefulWidget {
  const MyOrderMobileView(
      {super.key, required this.searchContoller, required this.redraw});
  final TextEditingController searchContoller;
  final Function() redraw;

  @override
  State<MyOrderMobileView> createState() => _MyOrderMobileViewState();
}

class _MyOrderMobileViewState extends State<MyOrderMobileView> {
  List<OrderModel> orders = [];
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      var nextPageTrigger = 0.8 * controller.position.maxScrollExtent;

      if (controller.position.pixels > nextPageTrigger) {
        if (getIt<MyOrdersBloc>().state is! MyOrderPageLoading) {
          getIt<MyOrdersBloc>().add(
            GetMyOrdersEvent(),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const NavigationMobileAppBar(
        title: 'Мои заявки',
      ),
      body: BlocConsumer<MyOrdersBloc, MyOrdersState>(
        listener: (context, state) {
          if (state is MyOrderFailure) {
            DefaultErrorView.call(
              message: state.message,
            );
          }
          if (state is MyOrdersLoaded) {
            setState(() {
              if (state.currentPage == 1) {
                orders = state.orders;
              } else {
                orders.addAll(state.orders);
              }
            });
          }
        },
        builder: (context, state) {
          return Container(
            color: DefaultColors.milkBG,
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: DefaultColors.milkBG,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: MobileDefaultOptionSelectView(
                            onSelect: (v) {
                              if (v.name == 'Все статусы') {
                                getIt<MyOrdersBloc>().selectedStatus = null;
                              } else {
                                getIt<MyOrdersBloc>().selectedStatus = v;
                              }
                              getIt<MyOrdersBloc>().page = 0;
                              getIt<MyOrdersBloc>().add(
                                MyOrderOpened(),
                              );
                              widget.redraw();
                            },
                            selectedItem: getIt<MyOrdersBloc>().selectedStatus,
                            items: const [
                              DictionaryModel(name: 'Все статусы'),
                              DictionaryModel(name: 'Статус 1'),
                              DictionaryModel(name: 'Статус 2'),
                            ],
                            label: getIt<MyOrdersBloc>().selectedStatus == null
                                ? 'Все статусы'
                                : 'Cтатусы',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: MobileDefaultDateRangePickerView(
                            startDate: getIt<MyOrdersBloc>().startDate,
                            endDate: getIt<MyOrdersBloc>().endDate,
                            onStartDateChange: (v) {
                              getIt<MyOrdersBloc>().startDate = v;
                              getIt<MyOrdersBloc>().page = 0;
                              getIt<MyOrdersBloc>().add(
                                MyOrderOpened(),
                              );
                              widget.redraw();
                            },
                            onEndDateChange: (v) {
                              getIt<MyOrdersBloc>().endDate = v;
                              getIt<MyOrdersBloc>().page = 0;
                              getIt<MyOrdersBloc>().add(
                                MyOrderOpened(),
                              );
                              widget.redraw();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                state is MyOrderLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : _buildOrdersList(orders, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrdersList(List<OrderModel>? orderModel, MyOrdersState state) {
    if (orderModel == null) {
      return const SizedBox.shrink();
    }
    if (orderModel.isEmpty) {
      return const NoOrdersView();
    }
    return Expanded(
      child: Scrollbar(
        controller: controller,
        thumbVisibility: true,
        interactive: true,
        thickness: 14,
        child: ListView.separated(
          controller: controller,
          padding: const EdgeInsets.all(16),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          },
          itemCount: state is MyOrderPageLoading
              ? orderModel.length + 1
              : orderModel.length,
          itemBuilder: (context, index) {
            if (index == orders.length) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return OrderWidget(
              order: orders[index],
            );
          },
        ),
      ),
    );
  }
}
