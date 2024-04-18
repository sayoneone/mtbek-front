import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/app/bloc/global_bloc_provider.dart';
import 'package:mtbek_front/view/app/routing/router_config.dart';
import 'package:mtbek_front/global_items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';

import 'view/common/default_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // localization entry point
  await EasyLocalization.ensureInitialized();

  // dependency injection entry point
  configureDependencies();
  await getIt.allReady();

  // remove # from url
  setPathUrlStrategy();

  // configure mobile ui
  SystemUiOverlayStyle.light.copyWith(
    systemNavigationBarColor: DefaultColors.white,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      child: const EntryPoint(),
    ),
  );
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBlocProvider(
      child: MaterialApp.router(
        title: 'MT BEK',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        // darkTheme: ThemeData(
        //   useMaterial3: true,
        //   colorSchemeSeed: DefaultColors.green500,
        //   // primaryColor: DefaultColors.green500,
        //   scaffoldBackgroundColor: DefaultColors.black,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        //   fontFamily: 'OpenSans-Regular',
        //   bottomSheetTheme: const BottomSheetThemeData(
        //     backgroundColor: Colors.transparent,
        //   ),
        // ),
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: DefaultColors.green500,
          scaffoldBackgroundColor: DefaultColors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'OpenSans-Regular',
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        scaffoldMessengerKey: snackbarKey,
        locale: context.locale,
      ),
    );
  }
}
