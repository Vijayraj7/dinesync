import 'dart:math';

import 'package:dinesync/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dinesync/Database/dataposting.dart';
import 'package:dinesync/Theme/showsnack.dart';
import 'package:dinesync/main.dart';

class Oper extends StatefulWidget {
  Oper({
    super.key,
    this.k,
    this.child,
  });
  String? k;
  Widget? child;

  @override
  State<Oper> createState() => _OperState();
}

class _OperState extends State<Oper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // printer('f');
    super.build(context);
    return GetMaterialApp(
      title: 'Workspots',
      scaffoldMessengerKey: widget.k == null
          ? null
          : GlobalKey<ScaffoldMessengerState>(
              debugLabel: widget.k! + Random().nextInt(999).toString()),
      navigatorKey: widget.k == null
          ? null
          : GlobalKey<NavigatorState>(
              debugLabel: widget.k! + Random().nextInt(999).toString()),
      key: widget.k == null
          ? null
          : GlobalKey<FormState>(
              debugLabel: widget.k! + Random().nextInt(999).toString()),
      builder: (co, ch) {
        return ScrollConfiguration(
          behavior: ScollGlowBehaviour(),
          child: ch!,
        );
      },
      // useInheritedMediaQuery: true,
      theme: ThemeData(
        // textTheme: GoogleFonts.latoTextTheme(TextTheme(
        //   displayLarge: TextStyle(fontSize: 18.sp),
        //   displayMedium: TextStyle(fontSize: 15.sp),
        //   displaySmall: TextStyle(fontSize: 13.sp),
        // )),
        // canvasColor: Colors.transparent,
        // useMaterial3: true,
        primaryColor: Colors.black,
        primarySwatch: primaryBlack,
      ),
      defaultTransition: Transition.cupertinoDialog,
      //  routingCallback: MiddleWare.observer,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: widget.child,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
