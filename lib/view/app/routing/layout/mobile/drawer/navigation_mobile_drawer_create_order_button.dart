import 'package:mtbek_front/view/screens/orders/create_order/create_order_view.dart';
import 'package:flutter/material.dart';

class NavigationMobileDrawerCreateOrderButton extends StatelessWidget {
  const NavigationMobileDrawerCreateOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        showDialog(
          context: context,
          useSafeArea: false,
          builder: (context) => const CreateOrderView(),
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: const Text(
          'Добавить заявку',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
