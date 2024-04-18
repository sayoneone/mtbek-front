import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/responsive/responsive_layout_handler.dart';
import 'package:mtbek_front/view/screens/cars/my_cars_screen/bloc/my_cars_bloc.dart';
import 'package:mtbek_front/view/screens/cars/my_cars_screen/layout/desktop/my_cars_desktop_view.dart';
import 'package:mtbek_front/view/screens/cars/my_cars_screen/layout/mobile/my_cars_mobile_view.dart';
import 'package:mtbek_front/view/utils/navigable.dart';
import 'package:mtbek_front/view/utils/routes.dart';
import 'package:flutter/material.dart';

class MyCarsScreen extends StatefulWidget implements Navigable {
  const MyCarsScreen({super.key});

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();

  @override
  String getName() => Routes.myCars;
}

class _MyCarsScreenState extends State<MyCarsScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    getIt<MyCarsBloc>().add(const MyCarsOpened());
    super.initState();

    searchController.addListener(() {
      getIt<MyCarsBloc>().searchQuery = searchController.text;
    });

    searchController.text = getIt<MyCarsBloc>().searchQuery ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutHandler(
      mobileView: const MyCarsMobileView(),
      desktopView: MyCarsDesktopView(
        searchContoller: searchController,
        redraw: () => setState(() {}),
      ),
    );
  }
}
