import 'package:flutter/material.dart';

class RootInherited extends InheritedWidget {
  final int currentTab;
  final Function(int) onTabSwitch;

  const RootInherited({
    super.key,
    required super.child,
    required this.currentTab,
    required this.onTabSwitch,
  });

  static RootInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RootInherited>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
