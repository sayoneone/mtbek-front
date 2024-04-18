import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:flutter/material.dart';

class DefaultDesktopSearchView extends StatelessWidget {
  const DefaultDesktopSearchView({
    super.key,
    required this.searchController,
    required this.title,
  });

  final TextEditingController searchController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: DefaultextField(
        controller: searchController,
        isError: false,
        hint: title,
        errorText: '',
      ),
    );
  }
}
