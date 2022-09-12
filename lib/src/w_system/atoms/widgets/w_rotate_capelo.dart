import 'dart:math' as math;

import 'package:flutter/material.dart';

class WRotateCapelo extends StatefulWidget {
  const WRotateCapelo({
    Key? key,
    required this.onFinishAnimation,
  }) : super(key: key);

  final VoidCallback onFinishAnimation;

  @override
  State<WRotateCapelo> createState() => _WRotateCapeloState();
}

class _WRotateCapeloState extends State<WRotateCapelo>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  void notifyCompleted() {
    if (_controller.isCompleted) {
      widget.onFinishAnimation();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(notifyCompleted);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.removeListener(notifyCompleted);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Image.asset('assets/images/capelo.png'),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
