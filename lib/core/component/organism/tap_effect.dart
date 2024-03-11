import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TapEffect extends StatefulWidget {
  const TapEffect({
    super.key,
    this.onTap,
    required this.child,
    this.lowerBoundAnimation = 0.95,
    this.borderRadius,
  });

  final Function()? onTap;
  final Widget child;
  final double lowerBoundAnimation;
  final BorderRadius? borderRadius;

  @override
  State<TapEffect> createState() => _TapEffectState();
}

class _TapEffectState extends State<TapEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      lowerBound: widget.lowerBoundAnimation,
      upperBound: 1,
      vsync: this,
    );
    _controller.forward();
    super.initState();
  }

  ///Launch revers animation of ticket(setting scale to default size).
  void _tapDown(TapDownDetails details) {
    _controller.reverse();

    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  ///This trigger immediately before onTap event.
  ///Launch animation of changing scale ticket(reducing size of ticket).
  void _tapUp(TapUpDetails details) {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTapUp: _tapUp,
      // onTapDown: _tapDown,
      onTap: () async {
        _tapDown(TapDownDetails());
        await Future.delayed(const Duration(milliseconds: 100));
        _tapUp(TapUpDetails(kind: PointerDeviceKind.touch));
      },
      borderRadius: widget.borderRadius,
      child: ScaleTransition(
        scale: _controller,
        child: widget.child,
      ),
    );
  }
}
