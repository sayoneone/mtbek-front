import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/auth/registration/bloc/registration_bloc.dart';
import 'package:mtbek_front/view/auth/registration/components/navigate_login_button.dart';
import 'package:mtbek_front/view/auth/registration/components/policy_switch.dart';
import 'package:mtbek_front/view/auth/registration/registration_inherited.dart';
import 'package:mtbek_front/view/common/default_option_select_view.dart';
import 'package:mtbek_front/view/auth/registration/components/registration_button.dart';
import 'package:mtbek_front/view/common/default_logo.dart';
import 'package:mtbek_front/view/common/default_switch_view.dart';
import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:flutter/cupertino.dart';

class RegistrationDesktopContentView extends StatelessWidget {
  const RegistrationDesktopContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = RegistrationInherited.of(context);
    return LayoutBuilder(builder: (context, constarains) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: DefaultLogo(width: 50),
            ),
            SizedBox(height: constarains.maxHeight / 30),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constarains.maxWidth / 8,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Регистрация',
                        style: DefaultextStyles.title,
                      ),
                    ),
                    const SizedBox(height: 30),
                    DefaultSwitchView(
                      value: inherited.isBusiness,
                      title: inherited.isBusiness ? 'Юр лицо' : 'Физ лицо',
                      switchPressed: () => inherited.onBusinessSwitch(),
                    ),
                    const SizedBox(height: 10),
                    if (inherited.isBusiness)
                      DefaultextField(
                        controller: inherited.companyNameController,
                        hint: 'Наименование компании',
                        isError: false,
                        errorText: '',
                      ),
                    if (inherited.isBusiness) const SizedBox(height: 20),
                    DefaultextField(
                      controller: inherited.nameController,
                      hint: inherited.isBusiness ? 'ФИО руководителя' : 'ФИО',
                      isError: false,
                      errorText: '',
                    ),
                    const SizedBox(height: 20),
                    DefaultextField(
                      controller: inherited.emailController,
                      hint: 'Почта',
                      isError: false,
                      errorText: '',
                    ),
                    const SizedBox(height: 20),
                    DefaultextField(
                      controller: inherited.phoneContoller,
                      hint: 'Телефон',
                      isError: false,
                      errorText: '',
                    ),
                    const SizedBox(height: 20),
                    DefaultextField(
                      isPassword: true,
                      passwordVisibilityCallback: () =>
                          inherited.onPasswordVisibilitySwitch(),
                      controller: inherited.passwordController,
                      passwordHidden: !inherited.isPasswordVisible,
                      hint: 'Пароль',
                      isError: false,
                      errorText: '',
                    ),
                    const SizedBox(height: 20),
                    DefaultOptionSelectView(
                      onSelect: (v) => inherited.onRegionSelect(v),
                      selectedItem: inherited.selectedRegion,
                      items: getIt<RegistrationBloc>().regions,
                      label: 'Город',
                    ),
                    const SizedBox(height: 20),
                    PolicySwitch(
                      isPolicyAccepted: inherited.isPolicyAccepted,
                      switchPolicy: inherited.onPolicySwitch(),
                    ),
                    const SizedBox(height: 20),
                    RegistrationButton(
                      isPolicyAccepted: inherited.isPolicyAccepted,
                      companyName: inherited.companyNameController,
                      name: inherited.nameController,
                      email: inherited.emailController,
                      phone: inherited.phoneContoller,
                      password: inherited.passwordController,
                      region: inherited.selectedRegion,
                      isBusiness: inherited.isBusiness,
                    ),
                    const SizedBox(height: 30),
                    const NavigateLoginButton(
                      isMobile: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
