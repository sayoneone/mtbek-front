import 'package:mtbek_front/domain/model/order_model.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:mtbek_front/view/common/mobile/animated_expansion_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: DefaultColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildListTile(
            title: 'Номер заявки',
            child: Text(
              '0000456546', //order.type.toString(),
              style: DefaultextStyles.mobileTertiary.copyWith(
                color: DefaultColors.blue500,
              ),
            ),
          ),
          orderDivider(),
          buildListTile(
            title: 'Тип заявки',
            child: const Text(
              'Ремонт (СТО)', // order.type.toString(),
            ),
          ),
          orderDivider(),
          buildListTile(
            title: 'Водитель',
            child: const Text(
              'Акжаров А.С.', // order.type.toString(),
            ),
          ),
          orderDivider(),
          buildListTile(
            title: 'Марка авто',
            child: const Text(
              'BMW', //  order.type.toString(),
            ),
          ),
          orderDivider(),
          buildListTile(
            title: 'Статус заявки',
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DefaultColors.green100,
              ),
              child: const Text(
                'Оплачен', //  order.type.toString(),
                style: TextStyle(color: DefaultColors.green500),
              ),
            ),
          ),
          AnimatedExpansionWidget(
            children: [
              orderDivider(),
              buildListTile(
                title: 'Гос номер',
                child: const Text(
                  '911 AKL 02', //  order.type.toString(),
                ),
              ),
              orderDivider(),
              buildListTile(
                title: 'Дата создания',
                child: Text(
                  order.createdAt != null
                      ? DateFormat('dd.MM.yyyy').format(order.createdAt!)
                      : '--',
                ),
              ),
              orderDivider(),
              buildListTile(
                title: 'Дата завершения',
                child: Text(
                  order.completedAt != null
                      ? DateFormat('dd.MM.yyyy').format(order.completedAt!)
                      : '--',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListTile({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: DefaultextStyles.mobileTertiary,
          ),
          const SizedBox(
            height: 4,
          ),
          child,
        ],
      ),
    );
  }

  Widget orderDivider() {
    return const Divider(
      color: DefaultColors.grey100,
    );
  }
}
