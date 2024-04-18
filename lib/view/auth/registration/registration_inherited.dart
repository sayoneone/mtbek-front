import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:flutter/material.dart';

class RegistrationInherited extends InheritedWidget {
  final TextEditingController companyNameController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneContoller;
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final RegionModel? selectedRegion;
  final bool isBusiness;
  final bool isPolicyAccepted;
  final Function() onBusinessSwitch;
  final Function() onPasswordVisibilitySwitch;
  final Function() onPolicySwitch;
  final Function(RegionModel) onRegionSelect;

  const RegistrationInherited({
    super.key,
    required super.child,
    required this.companyNameController,
    required this.emailController,
    required this.isBusiness,
    required this.isPasswordVisible,
    required this.isPolicyAccepted,
    required this.nameController,
    required this.passwordController,
    required this.phoneContoller,
    required this.selectedRegion,
    required this.onBusinessSwitch,
    required this.onPasswordVisibilitySwitch,
    required this.onPolicySwitch,
    required this.onRegionSelect,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static RegistrationInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RegistrationInherited>()!;
  }
}
