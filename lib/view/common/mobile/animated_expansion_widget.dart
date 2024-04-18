import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:flutter/material.dart';

class AnimatedExpansionWidget extends StatefulWidget {
  const AnimatedExpansionWidget({
    super.key,
    this.children = const <Widget>[],
  });

  final List<Widget> children;

  @override
  AnimatedExpansionWidgetState createState() => AnimatedExpansionWidgetState();
}

class AnimatedExpansionWidgetState extends State<AnimatedExpansionWidget>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  late Animatable<double> _heightFactorTween;
  late Animatable<double> _turnsTween;

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _heightFactorTween = CurveTween(curve: Curves.easeIn);
    _turnsTween = CurveTween(curve: Curves.easeIn);

    _controller = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);
    _heightFactor = _controller.drive(_heightFactorTween);
    _iconTurns = _controller.drive(_halfTween.chain(_turnsTween));

    _isExpanded = PageStorage.of(context).readState(context) as bool? ?? false;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setExpansion(bool shouldBeExpanded) {
    if (shouldBeExpanded != _isExpanded) {
      setState(() {
        _isExpanded = shouldBeExpanded;
        if (_isExpanded) {
          _controller.forward();
        } else {
          _controller.reverse().then<void>((void value) {
            if (!mounted) return;
            setState(() {
              // Rebuild without widget.children.
            });
          });
        }
        PageStorage.of(context).writeState(context, _isExpanded);
      });
    }
  }

  void toggleExpansion() {
    _setExpansion(!_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRect(
          child: Align(
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
        InkWell(
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          onTap: toggleExpansion,
          child: Container(
            decoration: const BoxDecoration(
              color: DefaultColors.blue100,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _isExpanded ? 'Скрыть' : 'Раскрыть',
                  style: const TextStyle(color: DefaultColors.blue500),
                ),
                RotationTransition(
                  turns: _iconTurns,
                  child: const Icon(
                    Icons.expand_more,
                    color: DefaultColors.blue500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed
          ? null
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            ),
    );
  }
}
