import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/domain/model/dictionaty_model.dart';
import 'package:mtbek_front/view/common/desktop/filter/tt_desktop_search_view.dart';
import 'package:mtbek_front/view/common/desktop/desktop_filter_view.dart';
import 'package:mtbek_front/view/common/desktop/desktop_screen_title_view.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_date_range_picker_view.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:mtbek_front/view/common/default_option_select_view.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/bloc/my_orders_bloc.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/components/no_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersDesktopView extends StatelessWidget {
  const MyOrdersDesktopView({
    super.key,
    required this.searchContoller,
    required this.redraw,
  });

  final TextEditingController searchContoller;
  final Function() redraw;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersBloc, MyOrdersState>(
      listener: (context, state) {
        if (state is MyOrderFailure) {
          DefaultErrorView.call(
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        return Container(
          color: DefaultColors.milkBG,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const DesktopScreenTitleView(
                title: 'Мои заявки',
              ),
              const SizedBox(height: 20),
              DesktopFilterView(
                items: Row(
                  children: [
                    Flexible(
                      child: DefaultDesktopSearchView(
                        title: 'Поиск по заявкам',
                        searchController: searchContoller,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: DefaultOptionSelectView(
                          onSelect: (v) {
                            if (v.name == 'Все статусы') {
                              getIt<MyOrdersBloc>().selectedStatus = null;
                            } else {
                              getIt<MyOrdersBloc>().selectedStatus = v;
                            }
                            redraw();
                          },
                          selectedItem: getIt<MyOrdersBloc>().selectedStatus,
                          items: const [
                            DictionaryModel(name: 'Все статусы'),
                            DictionaryModel(name: '1'),
                            DictionaryModel(name: '2'),
                          ],
                          label: 'Cтатус',
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: DefaultDateRangePickerView(
                        startDate: getIt<MyOrdersBloc>().startDate,
                        endDate: getIt<MyOrdersBloc>().endDate,
                        onStartDateChange: (v) {
                          getIt<MyOrdersBloc>().startDate = v;
                          redraw();
                        },
                        onEndDateChange: (v) {
                          getIt<MyOrdersBloc>().endDate = v;
                          redraw();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (state is MyOrdersLoaded) ...[
                (state.orders.isNotEmpty)
                    ? Text(
                        state.orders.length.toString(),
                      )
                    : const NoOrdersView(),
              ],
            ],
          ),
        );
      },
    );
  }
}
