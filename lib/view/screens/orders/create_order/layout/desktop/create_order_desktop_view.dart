import 'package:mtbek_front/view/app/routing/router_config.dart';
import 'package:mtbek_front/view/common/adaptive_side_image_view.dart';
import 'package:mtbek_front/view/common/default_app_bar.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/screens/orders/create_order/layout/desktop/create_order_desktop_content_view.dart';
import 'package:flutter/material.dart';

class CreateOrderDesktopView extends StatelessWidget {
  const CreateOrderDesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth / 8,
            vertical: constraints.maxHeight / 8.5,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Scaffold(
            appBar: DefaultAppBar(
              isLeadingEnabled: false,
              color: DefaultColors.transparent,
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () => router.pop(),
                    icon: const Icon(
                      Icons.close,
                      color: DefaultColors.black,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: DefaultColors.transparent,
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Row(
                  children: [
                    AdaptiveSideImageView(
                      imagePath: 'assets/images/parts.png',
                      enviromentWidth: constraints.maxWidth,
                      objectWidth: constraints.maxWidth / 2.8,
                    ),
                    const Flexible(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CreateOrderDesktopContentView(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
