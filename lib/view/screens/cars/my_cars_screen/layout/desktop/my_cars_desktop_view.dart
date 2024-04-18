import 'package:mtbek_front/view/common/desktop/filter/tt_desktop_search_view.dart';
import 'package:mtbek_front/view/common/desktop/desktop_filter_view.dart';
import 'package:mtbek_front/view/common/desktop/desktop_screen_title_view.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_desktop_table_view.dart';
import 'package:mtbek_front/view/screens/cars/my_cars_screen/components/navigate_create_car_button.dart';
import 'package:flutter/material.dart';

class MyCarsDesktopView extends StatelessWidget {
  const MyCarsDesktopView({
    super.key,
    required this.searchContoller,
    required this.redraw,
  });

  final TextEditingController searchContoller;
  final Function redraw;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DefaultColors.milkBG,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          //кривоватый фикс
          const SizedBox(height: 20),
          const DesktopScreenTitleView(
            title: 'Мои машины',
            trailing: NavigateCreateCarButton(),
          ),
          const SizedBox(height: 20),
          DesktopFilterView(
            items: Row(
              children: [
                Flexible(
                  child: DefaultDesktopSearchView(
                    searchController: searchContoller,
                    title: 'Поиск по машинам',
                  ),
                ),
                const SizedBox(width: 20),
                const SizedBox(width: 20),
              ],
            ),
          ),
          const DefaultDesktopTableView(
            titles: [
              'Номер заявки',
              'Тип заявки',
              'Водитель',
              'Марка авто',
              'Гос номер',
              'Дата создания',
              'Дата завершения',
              'Статус заявки',
            ],
            items: [
              [
                '1',
                'Тип1',
                'Водитель1',
                'Марка1',
                'Гос1',
                '01-01-2022',
                '02-01-2022',
                'Статус1'
              ],
              [
                '2',
                'Тип2',
                'Водитель2',
                'Марка2',
                'Гос2',
                '03-01-2022',
                '04-01-2022',
                'Статус2'
              ],
            ],
          ),
        ],
      ),
    );
  }
}
