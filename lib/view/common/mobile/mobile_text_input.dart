import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MobiletextField extends StatelessWidget {
  const MobiletextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isError,
    required this.errorText,
    this.isPassword = false,
    this.isPhone = false,
    this.isLong = false,
    this.maxLength,
    this.passwordVisibilityCallback,
    this.isNessary = true,
    this.passwordHidden = false,
    this.borderColor,
  });

  final TextEditingController controller;
  final String hint;
  final bool isError;
  final String errorText;

  final bool isPassword;
  final bool isNessary;
  final bool isPhone;
  final bool isLong;
  final int? maxLength;
  final Function()? passwordVisibilityCallback;
  final bool passwordHidden;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters:
          isPhone ? [MaskTextInputFormatter(mask: "+7 ### ### ## ##")] : null,
      obscureText: passwordHidden,
      keyboardType: isPhone
          ? TextInputType.phone
          : (isLong ? TextInputType.multiline : TextInputType.text),
      minLines: 1,
      maxLines: isLong ? 5 : 1,
      maxLength: maxLength,
      controller: controller,
      style: DefaultextStyles.mobileTertiary,
      decoration: InputDecoration(
        label: Text(
          hint,
          style: DefaultextStyles.mobileTertiary,
        ),
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsets.only(right: 12),
                child: IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    if (passwordVisibilityCallback != null) {
                      passwordVisibilityCallback!();
                    }
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: DefaultColors.mediumGrey,
                  ),
                ),
              )
            : null,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: borderColor ?? DefaultColors.mediumGrey,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        errorText: isError ? errorText : null,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: DefaultColors.red500,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: borderColor ?? DefaultColors.mediumGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0.5,
            color: borderColor ?? DefaultColors.mediumGrey,
          ),
        ),
      ),
    );
  }
}
