import 'package:flutter/material.dart';

import '../../utils/navigable.dart';
import '../../utils/routes.dart';

class OtpScreen extends StatefulWidget implements Navigable {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();

  @override
  String getName() => Routes.otp;
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
