import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:flutter/material.dart';

class ForgotPasswordMobileContentView extends StatelessWidget {
  final TextEditingController loginContoller;

  const ForgotPasswordMobileContentView({
    super.key,
    required this.loginContoller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultextField(
          controller: loginContoller,
          hint: 'Почта',
          isError: false,
          errorText: '',
        ),
      ],
    );
  }
}
