import 'package:mtbek_front/view/screens/cars/create_car/create_car_view.dart';
import 'package:flutter/material.dart';

class NavigateCreateCarButton extends StatelessWidget {
  const NavigateCreateCarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 33,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          'Добавить машину',
          style: TextStyle(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          useSafeArea: false,
          builder: (context) => const CreateCarView(),
        );
      },
    );
  }
}
