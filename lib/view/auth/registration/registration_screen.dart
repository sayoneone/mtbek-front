import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/view/auth/registration/bloc/registration_bloc.dart';
import 'package:mtbek_front/view/auth/registration/layout/desktop/registration_desktop_view.dart';
import 'package:mtbek_front/view/auth/registration/layout/mobile/registration_mobile_view.dart';
import 'package:mtbek_front/view/auth/registration/registration_inherited.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:mtbek_front/view/responsive/responsive_layout_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../utils/navigable.dart';
import '../../utils/routes.dart';

class RegistrationScreen extends StatefulWidget implements Navigable {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();

  @override
  String getName() => Routes.registration;
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneContoller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  RegionModel? selectedRegion;
  bool isBusiness = false;
  bool isPolicyAccepted = false;

  @override
  void initState() {
    super.initState();
    getIt<RegistrationBloc>().add(RegionsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: BlocProvider.value(
        value: getIt<RegistrationBloc>(),
        child: BlocConsumer<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            if (state is RegistrationFailure) {
              DefaultErrorView.call(
                message: state.message,
              );
            }
          },
          builder: (context, state) {
            return RegistrationInherited(
              companyNameController: companyNameController,
              nameController: nameController,
              emailController: emailController,
              phoneContoller: phoneContoller,
              passwordController: passwordController,
              isPasswordVisible: isPasswordVisible,
              selectedRegion: selectedRegion,
              isBusiness: isBusiness,
              isPolicyAccepted: isPolicyAccepted,
              onBusinessSwitch: () => setState(
                () => isBusiness = !isBusiness,
              ),
              onPasswordVisibilitySwitch: () {
                setState(
                  () => isPasswordVisible = !isPasswordVisible,
                );
              },
              onPolicySwitch: () {
                setState(
                  () => isPolicyAccepted = !isPolicyAccepted,
                );
              },
              onRegionSelect: (region) => setState(
                () => selectedRegion = region,
              ),
              child: const ResponsiveLayoutHandler(
                mobileView: RegistrationMobileView(),
                desktopView: RegistrationDesktopView(),
              ),
            );
          },
        ),
      ),
    );
  }
}
