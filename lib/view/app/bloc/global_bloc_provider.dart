import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/app/bloc/user_bloc/user_bloc.dart';
import 'package:mtbek_front/view/screens/cars/my_cars_screen/bloc/my_cars_bloc.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/bloc/my_orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_bloc/auth_bloc.dart';

class GlobalBlocProvider extends StatelessWidget {
  final Widget child;

  const GlobalBlocProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()..add(AppStarted())),
        BlocProvider(create: (context) => getIt<UserBloc>()),
        BlocProvider(create: (context) => getIt<MyOrdersBloc>()),
        BlocProvider(create: (context) => getIt<MyCarsBloc>()),
      ],
      child: child,
    );
  }
}
