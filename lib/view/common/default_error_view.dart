import 'package:mtbek_front/global_items.dart';
import 'package:flutter/material.dart';

class DefaultErrorView {
  static void call({required String message}) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
    // Flushbar(
    //   backgroundColor: Colors.red500,
    //   borderRadius: BorderRadius.circular(10),
    //   margin: EdgeInsets.symmetric(
    //     horizontal: MediaQuery.of(context).size.width / 8,
    //     vertical: 15,
    //   ),
    //   dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    //   flushbarPosition: FlushbarPosition.TOP,
    //   message: message,
    //   forwardAnimationCurve: Curves.ease,
    //   reverseAnimationCurve: Curves.ease,
    //   duration: const Duration(
    //     seconds: 2,
    //   ),
    // ).show(context);
  }
}
