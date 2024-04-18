import 'package:mtbek_front/core/injection/configurator.dart';

import 'package:mtbek_front/view/responsive/responsive_layout_handler.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/bloc/my_orders_bloc.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/layout/desktop/my_orders_desktop_view.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/layout/mobile/my_requests_mobile_view.dart';
import 'package:mtbek_front/view/utils/navigable.dart';
import 'package:mtbek_front/view/utils/routes.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget implements Navigable {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();

  @override
  String getName() => Routes.myOrders;
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getIt<MyOrdersBloc>().add(MyOrderOpened());
    //это нужно чтобы мы не теряли поисковый запрос пользователя после смены экрана
    searchController.text = getIt<MyOrdersBloc>().searchQuery;

    searchController.addListener(() {
      getIt<MyOrdersBloc>().searchQuery = searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutHandler(
      mobileView: MyOrderMobileView(
        searchContoller: searchController,
        redraw: () => setState(() {}),
      ),
      desktopView: MyOrdersDesktopView(
        searchContoller: searchController,
        redraw: () => setState(() {}),
      ),
    );
  }
}
