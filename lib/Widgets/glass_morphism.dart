import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;
  const GlassMorphism(
      {Key? key,
      required this.blur,
      required this.opacity,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              )),
          child: child,
        ),
      ),
    );
  }
}
