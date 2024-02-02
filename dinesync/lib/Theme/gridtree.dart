import 'package:dinesync/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:workspots/Theme/fonts.dart';

Widget gridtree(
    {required List<Widget> children,
    String? title,
    required int count,
    Widget? header}) {
  var tcount = children.length / count;
  int ttcount = tcount.toInt();
  int ocount = tcount > ttcount ? ttcount + 1 : ttcount;
  var p = count;
  return Container(
    child: SingleChildScrollView(
      primary: true,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (title != null)
            ListTile(
              title: Text(
                title,
                style: Fonts.primary(
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 24.sp)),
              ),
            ),
          // header != null ? SizedBox(height: 30.h) : SizedBox(),
          // header ?? SizedBox(),
          // header != null ? SizedBox(height: 30.h) : SizedBox(),
          for (var i = 0; i < ocount; i++)
            Container(
              // height: 100.h,
              // margin: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (var j = 0; j < count; j++)
                    ((i * count) + j) < children.length
                        ? children[((i * count) + j)]
                        : Expanded(child: Container())
                ],
              ),
            )
        ],
      ),
    ),
  );
}
