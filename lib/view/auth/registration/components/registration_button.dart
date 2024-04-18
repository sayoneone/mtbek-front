import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/domain/model/region_model.dart';
import 'package:mtbek_front/view/auth/registration/bloc/registration_bloc.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:flutter/material.dart';

class RegistrationButton extends StatefulWidget {
  const RegistrationButton({
    super.key,
    required this.companyName,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.region,
    required this.isBusiness,
    required this.isPolicyAccepted,
  });

  final TextEditingController companyName;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final RegionModel? region;
  final bool isBusiness;
  final bool isPolicyAccepted;

  @override
  State<RegistrationButton> createState() => _RegistrationButtonState();
}

class _RegistrationButtonState extends State<RegistrationButton> {
  bool isCompanyFieldValid = false;
  bool isNameFieldValid = false;
  bool isEmailFieldValid = false;
  bool isPhoneFieldValid = false;
  bool isPasswordFieldValid = false;

  @override
  void initState() {
    widget.companyName.addListener(() {
      if (widget.companyName.text.isEmpty) {
        isCompanyFieldValid = false;
      } else {
        isCompanyFieldValid = true;
      }
      setState(() {});
    });
    widget.name.addListener(() {
      if (widget.name.text.isEmpty) {
        isNameFieldValid = false;
      } else {
        isNameFieldValid = true;
      }
      setState(() {});
    });
    widget.email.addListener(() {
      if (widget.email.text.isEmpty) {
        isEmailFieldValid = false;
      } else {
        isEmailFieldValid = true;
      }
      setState(() {});
    });
    widget.phone.addListener(() {
      if (widget.phone.text.isEmpty) {
        isPhoneFieldValid = false;
      } else {
        isPhoneFieldValid = true;
      }
      setState(() {});
    });
    widget.password.addListener(() {
      if (widget.password.text.isEmpty) {
        isPasswordFieldValid = false;
      } else {
        isPasswordFieldValid = true;
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          color: ((widget.isBusiness ? isCompanyFieldValid : true) &&
                  isNameFieldValid &&
                  isEmailFieldValid &&
                  isPhoneFieldValid &&
                  isPasswordFieldValid &&
                  widget.isPolicyAccepted)
              ? Theme.of(context).primaryColor
              : DefaultColors.grey100,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          'Регистрация',
          style: TextStyle(
            color: ((widget.isBusiness ? isCompanyFieldValid : true) &&
                    isNameFieldValid &&
                    isEmailFieldValid &&
                    isPhoneFieldValid &&
                    isPasswordFieldValid &&
                    widget.isPolicyAccepted)
                ? Theme.of(context).scaffoldBackgroundColor
                : DefaultColors.grey300,
            fontSize: 18,
          ),
        ),
      ),
      onPressed: () {
        if ((widget.isBusiness ? isCompanyFieldValid : true) &&
            isNameFieldValid &&
            isEmailFieldValid &&
            isPhoneFieldValid &&
            isPasswordFieldValid &&
            widget.isPolicyAccepted) {
          getIt<RegistrationBloc>().add(
            RegistrationRequested(
              companyName: widget.companyName.text.isNotEmpty
                  ? widget.companyName.text
                  : null,
              name: widget.name.text,
              email: widget.email.text,
              phone: widget.phone.text,
              password: widget.password.text,
              region: widget.region!,
              isBusiness: widget.isBusiness,
            ),
          );
        } else {
          DefaultErrorView.call(
            message: 'Заполните обязательные поля',
          );
        }
      },
    );
  }
}
