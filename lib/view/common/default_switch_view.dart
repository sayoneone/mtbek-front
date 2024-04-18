import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:flutter/cupertino.dart';

class DefaultSwitchView extends StatelessWidget {
  const DefaultSwitchView({
    super.key,
    required this.value,
    required this.title,
    required this.switchPressed,
  });

  final bool value;
  final String title;
  final Function() switchPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoSwitch(
          value: value,
          onChanged: (v) => switchPressed(),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: DefaultextStyles.body,
        ),
      ],
    );
  }
}
