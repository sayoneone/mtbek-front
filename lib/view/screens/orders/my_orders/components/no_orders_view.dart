import 'package:mtbek_front/view/app/routing/layout/desktop/components/navigation_desktop_app_bar_create_request_button.dart';
import 'package:flutter/material.dart';

class NoOrdersView extends StatelessWidget {
  const NoOrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 4,
              vertical: 20,
            ),
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/no_orders.png',
                  width: 400,
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Мои заявки отсутствуют',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Создайте нужную вам заявку, одну или несколько по вашим предпочтениям',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 20),
              const NavigationDesktopAppBarCreateOrderButton(),
            ],
          );
        },
      ),
    );
  }
}
