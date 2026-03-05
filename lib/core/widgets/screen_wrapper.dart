import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget child;
  final SystemUiOverlayStyle? overlayStyle;
  const ScreenWrapper({super.key, required this.child, this.overlayStyle});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          overlayStyle ??
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
      child: child,
    );
  }
}
