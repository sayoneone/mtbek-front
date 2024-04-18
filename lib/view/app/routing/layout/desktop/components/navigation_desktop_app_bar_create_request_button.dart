import 'package:mtbek_front/view/screens/orders/create_order/create_order_view.dart';
import 'package:flutter/material.dart';

class NavigationDesktopAppBarCreateOrderButton extends StatelessWidget {
  const NavigationDesktopAppBarCreateOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          'Создать заявку',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          useSafeArea: false,
          builder: (context) => const CreateOrderView(),
        );
      },
    );
  }
}
