import 'package:mtbek_front/view/common/default_app_bar.dart';
import 'package:flutter/material.dart';

enum DefaultScaffoldPaddingSize { L, M }

class DefaultScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? color;
  final FloatingActionButton? floatingActionButton;
  final DefaultScaffoldPaddingSize paddingSize;

  const DefaultScaffold({
    Key? key,
    this.appBar,
    this.color,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.paddingSize = DefaultScaffoldPaddingSize.L,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: appBar ?? const DefaultAppBar(),
      body: Container(
        padding: padding,
        child: body,
      ),
      floatingActionButton: floatingActionButton == null
          ? null
          : SafeArea(child: floatingActionButton!),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: bottomNavigationBar,
      ),
    );
  }

  EdgeInsetsGeometry get padding {
    switch (paddingSize) {
      case DefaultScaffoldPaddingSize.L:
        return const EdgeInsets.all(16.0);
      case DefaultScaffoldPaddingSize.M:
        return const EdgeInsets.all(8.0);
      default:
        return const EdgeInsets.all(16.0);
    }
  }
}
