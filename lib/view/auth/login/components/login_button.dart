import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/auth/login/bloc/login_bloc.dart';
import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.loginContoller,
    required this.passwordController,
  });

  final TextEditingController loginContoller;
  final TextEditingController passwordController;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    //этот костыль существует из-за того, что listener не срабатывает при изменении размера view port
    validator();
    widget.loginContoller.addListener(() => validator());
    widget.passwordController.addListener(() => validator());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInCirc,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isButtonEnabled ? Colors.green : DefaultColors.grey100,
        ),
        child: Center(
          child: Text(
            'Войти',
            style: TextStyle(
              fontSize: 18,
              color: isButtonEnabled ? Colors.white : DefaultColors.grey300,
            ),
          ),
        ),
      ),
      onPressed: () {
        if (isButtonEnabled) {
          getIt<LoginBloc>().add(
            LoginRequested(
              username: widget.loginContoller.text,
              password: widget.passwordController.text,
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

  void validator() {
    if (widget.passwordController.text.isEmpty ||
        widget.loginContoller.text.isEmpty) {
      isButtonEnabled = false;
    } else {
      isButtonEnabled = true;
    }
    if (mounted) {
      setState(() {});
    }
  }
}
