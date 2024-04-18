import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:mtbek_front/view/app/bloc/user_bloc/user_bloc.dart';
import 'package:mtbek_front/view/app/routing/router_config.dart';
import 'package:mtbek_front/view/utils/navigable.dart';
import 'package:mtbek_front/view/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget implements Navigable {
  const App({super.key});
  @override
  String getName() => Routes.app;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authorized) {
          getIt<UserBloc>().add(CurrentUserRequested());

          router.pushNamed(Routes.myOrders);
        } else {
          router.pushNamed(Routes.login);
        }
      },
      child: Container(),
    );
  }
}
