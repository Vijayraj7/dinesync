import 'package:dinesync/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
// import 'package:workspots/Theme/fonts.dart';

btSheet({required List<Widget> children, Widget? header, String? title}) async {
  await Get.bottomSheet(BottomSheet(
      backgroundColor: Colors.white,
      enableDrag: false,
      // animationController: AnimationController(vsync: vsync),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      )),
      onClosing: () {},
      builder: (c) {
        return Container(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              height: 25.h,
              child: Center(
                child: Icon(Icons.horizontal_rule_rounded),
              ),
            ),
            Container(
                child: Center(
              child: header ??
                  Text(
                    title ?? "",
                    style: Fonts.primary(
                        style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    )),
                  ),
            )),
            for (var child in children) child,
          ],
        )));
      }));
}

btShee(
    {required List<Widget> children,
    Widget? header,
    Widget? below,
    Color? color,
    bool? tobottom = false,
    String? title}) async {
  ScrollController c = ScrollController();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    if (tobottom == true) {
      c.animateTo(
        c.position.maxScrollExtent,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    }
  });
  await Get.bottomSheet(SnappingSheet(
    child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          //  shape: BoxShape.rectangle
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: SingleChildScrollView(
            controller: c,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  height: 25.h,
                  child: Center(
                    child: Icon(Icons.horizontal_rule_rounded),
                  ),
                ),
                Container(
                    child: Center(
                  child: header ??
                      Text(
                        title ?? "",
                        style: Fonts.primary(
                            style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                        )),
                      ),
                )),
                for (var child in children) child,
              ],
            ))),
  ));
}
