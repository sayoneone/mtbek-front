import 'package:mtbek_front/view/app/app.dart';
import 'package:mtbek_front/view/app/routing/root_navigation.dart';
import 'package:mtbek_front/view/auth/forgot_password/forgot_password_screen.dart';
import 'package:mtbek_front/view/auth/login/login_screen.dart';
import 'package:mtbek_front/view/auth/otp/otp_screen.dart';
import 'package:mtbek_front/view/auth/registration/registration_screen.dart';
import 'package:mtbek_front/view/page_not_found/page_not_found.dart';
import 'package:mtbek_front/view/screens/cars/my_cars_screen/my_cars_screen.dart';
import 'package:mtbek_front/view/screens/orders/my_orders/my_orders_screen.dart';
import 'package:mtbek_front/view/utils/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final routerKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  onException: (context, state, route) {
    debugPrint(state.error?.message);
    route.pushNamed(Routes.pageNotFound);
  },
  navigatorKey: routerKey,
  initialLocation: Routes.app,
  routes: [
    GoRoute(
      path: Routes.app,
      name: '/${Routes.app}',
      builder: (context, state) => const App(),
    ),
    GoRoute(
      name: Routes.forgotPassword,
      path: '/${Routes.forgotPassword}',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      name: Routes.login,
      path: '/${Routes.login}',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: Routes.registration,
      path: '/${Routes.registration}',
      builder: (context, state) => const RegistrationScreen(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: routerKey,
      builder: (context, state, navigationShell) => RootNavigation(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.myOrders,
              path: '/${Routes.myOrders}',
              builder: (context, state) => const MyOrdersScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.myCars,
              path: '/${Routes.myCars}',
              builder: (context, state) => const MyCarsScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: Routes.otp,
      path: '/${Routes.otp}',
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
      name: Routes.pageNotFound,
      path: '/${Routes.pageNotFound}',
      builder: (context, state) => const PageNotFound(),
    ),
  ],
);
