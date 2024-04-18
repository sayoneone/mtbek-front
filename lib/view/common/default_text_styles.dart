import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';

class DefaultextStyles {
  static TextStyle body = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18.0,
      fontFamily: 'OpenSans-Regular');

  static TextStyle title = const TextStyle(
    color: DefaultColors.green500,
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
    fontFamily: 'OpenSans-Regular',
  );

  static TextStyle tertiary = const TextStyle(
    color: DefaultColors.mediumGrey,
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    fontFamily: 'OpenSans-Regular',
  );
  static TextStyle mobileTertiary = const TextStyle(
    color: DefaultColors.mediumGrey,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    fontFamily: 'OpenSans-Regular',
  );
}
