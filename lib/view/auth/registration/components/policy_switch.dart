import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicySwitch extends StatelessWidget {
  const PolicySwitch({
    super.key,
    required this.isPolicyAccepted,
    required this.switchPolicy,
  });

  final bool isPolicyAccepted;
  final Function() switchPolicy;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isPolicyAccepted,
          onChanged: (v) => switchPolicy(),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () async => await launchUrl(
            Uri.parse(
              'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            ),
            mode: LaunchMode.externalApplication,
          ),
          child: const Text(
            'Политика конфиденциальности',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
