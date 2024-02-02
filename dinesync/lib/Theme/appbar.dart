import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:dinesync/Theme/fonts.dart';
import 'package:dinesync/Theme/images.dart';

AppBar appBar(
    {required String title,
    bool leading = true,
    Widget? leadingw,
    double? titlesize,
    bool? istitleicon,
    IconData? titleicon,
    Color? iconcolor,
    double? leadingsize,
    List<Widget>? actions,
    PreferredSizeWidget? bottom}) {
  return AppBar(
    bottom: bottom,
    actions: actions,
    backgroundColor: Colors.black,
    title: Row(
      children: [
        Text(
          title,
          style: Fonts.secondary(style: TextStyle(fontSize: titlesize)),
        ),
        SizedBox(width: 6.w),
        if (istitleicon != null)
          if (istitleicon == true)
            Container(
              padding: EdgeInsets.only(top: 3.h),
              child: Icon(
                titleicon ?? Icons.verified_rounded,
                color: iconcolor ?? Colors.blue,
                size: 18.r,
              ),
            ),
      ],
    ),
    leading: leadingw ??
        (leading
            ? IconButton(
                iconSize: leadingsize,
                splashRadius: 23.r,
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ))
            : null),
  );
}

SliverAppBar slivAppBar({
  required String title,
  bool leading = true,
  bool pinned = false,
  Widget? flexiblespace,
  double? expanded,
  List<Widget>? actions,
  TabController? tabController,
  TabBar? bottom,
}) {
  return SliverAppBar(
    expandedHeight: expanded,
    flexibleSpace: flexiblespace,
    actions: actions,
    leading: leading
        ? IconButton(
            splashRadius: 23.r,
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ))
        : null,
    backgroundColor: Colors.black,
    title: Text(title),
    bottom: bottom,
    // primary: true,
    centerTitle: false,
    pinned: false,
    floating: true,
  );
}

String iformat(int rp) {
  var indiaFormat = NumberFormat("#,##,###", "en_US");
  // ignore: prefer_interpolation_to_compose_strings
  return "₹" + indiaFormat.format(rp);
}

String? iformats(String rp) {
  var indiaFormat = NumberFormat("#,##,###", "en_US");
  // ignore: prefer_interpolation_to_compose_strings
  var db = double.tryParse(rp);
  if (db != null) {
    return "₹${indiaFormat.format(db)}";
  } else {
    return null;
  }
}
