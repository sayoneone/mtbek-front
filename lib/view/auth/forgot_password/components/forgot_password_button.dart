import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatefulWidget {
  final TextEditingController loginContoller;

  const ForgotPasswordButton({
    super.key,
    required this.loginContoller,
  });

  @override
  State<ForgotPasswordButton> createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends State<ForgotPasswordButton> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    widget.loginContoller.addListener(() {
      setState(() {
        if (widget.loginContoller.text.isEmpty) {
          isButtonEnabled = false;
        } else {
          isButtonEnabled = true;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // getIt<ForgotPasswordBloc>().add();
        DefaultErrorView.call(
          message: 'not implemented',
        );
      },
      child: AnimatedContainer(
        curve: Curves.easeInCirc,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isButtonEnabled ? Colors.green : DefaultColors.grey100,
        ),
        height: 50,
        child: Text(
          'Восстановить пароль',
          style: TextStyle(
            color: isButtonEnabled
                ? Theme.of(context).scaffoldBackgroundColor
                : DefaultColors.grey300,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
