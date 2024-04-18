import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/auth/registration/bloc/registration_bloc.dart';
import 'package:mtbek_front/view/auth/registration/components/policy_switch.dart';
import 'package:mtbek_front/view/auth/registration/registration_inherited.dart';
import 'package:mtbek_front/view/common/default_option_select_view.dart';
import 'package:mtbek_front/view/common/default_switch_view.dart';
import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:flutter/material.dart';

class RegistrationMobileContentView extends StatelessWidget {
  const RegistrationMobileContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = RegistrationInherited.of(context);
    return Column(
      children: [
        DefaultSwitchView(
          value: inherited.isBusiness,
          title: inherited.isBusiness ? 'Юр лицо' : 'Физ лицо',
          switchPressed: () => inherited.onBusinessSwitch(),
        ),
        const SizedBox(height: 30),
        if (inherited.isBusiness)
          DefaultextField(
            controller: inherited.companyNameController,
            hint: 'Наименование компании',
            isError: false,
            errorText: '',
          ),
        if (inherited.isBusiness) const SizedBox(height: 30),
        DefaultextField(
          controller: inherited.nameController,
          hint: inherited.isBusiness ? 'ФИО руководителя' : 'ФИО',
          isError: false,
          errorText: '',
        ),
        const SizedBox(height: 30),
        DefaultextField(
          controller: inherited.emailController,
          hint: 'Почта',
          isError: false,
          errorText: '',
        ),
        const SizedBox(height: 30),
        DefaultextField(
          controller: inherited.phoneContoller,
          hint: 'Телефон',
          isError: false,
          errorText: '',
        ),
        const SizedBox(height: 30),
        DefaultextField(
          isPassword: true,
          passwordVisibilityCallback: inherited.onPasswordVisibilitySwitch(),
          controller: inherited.passwordController,
          passwordHidden: !inherited.isPasswordVisible,
          hint: 'Пароль',
          isError: false,
          errorText: '',
        ),
        const SizedBox(height: 30),
        DefaultOptionSelectView(
          label: 'Город',
          onSelect: (v) => inherited.onRegionSelect(v),
          selectedItem: inherited.selectedRegion,
          items: getIt<RegistrationBloc>().regions,
        ),
        const SizedBox(height: 30),
        PolicySwitch(
          isPolicyAccepted: inherited.isPolicyAccepted,
          switchPolicy: inherited.onPolicySwitch,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
        ),
      ],
    );
  }
}
