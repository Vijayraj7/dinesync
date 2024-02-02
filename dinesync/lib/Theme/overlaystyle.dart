import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OverlayStyles extends StatelessWidget {
  Color? navColor = Colors.white;
  Widget child = Container();
  OverlayStyles({this.navColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: navColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        // systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: child,
    );
  }
}
