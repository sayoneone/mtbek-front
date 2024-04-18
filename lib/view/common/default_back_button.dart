import 'package:flutter/material.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator.canPop(context)
        ? BackButton(
            color: Theme.of(context).primaryColor,
            onPressed: () => Navigator.of(context).maybePop(),
          )
        : const SizedBox.shrink();
  }
}
