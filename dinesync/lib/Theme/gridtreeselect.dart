// reverse
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dinesync/Theme/fonts.dart';

Widget gridtreeSelect(
    {required List<Widget> children,
    required void Function(List<String>) onSelect,
    required List<String> imgs,
    String? title,
    required int count,
    Widget? header}) {
  List<String> selected = [];
  // bool longpressed =
  var tcount = children.length / count;
  int ttcount = tcount.toInt();
  int ocount = tcount > ttcount ? ttcount + 1 : ttcount;
  var p = count;
  return Container(
      child: SingleChildScrollView(
    child: Column(
      children: [
        if (title != null)
          ListTile(
            title: Text(
              title,
              style: Fonts.primary(
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp)),
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
              children: [
                for (var j = 0; j < count; j++)
                  ((i * count) + j) < children.length
                      ? Expanded(child: StatefulBuilder(builder: (c, set) {
                          return GestureDetector(
                              onTap: () {
                                // if (selected.isNotEmpty) {
                                set(() {
                                  if (selected
                                      .contains(imgs[((i * count) + j)])) {
                                    selected.remove(imgs[((i * count) + j)]);
                                  } else {
                                    if (selected.length <= 7) {
                                      selected.add(imgs[((i * count) + j)]);
                                    }
                                  }
                                });
                                onSelect(selected);
                                // }
                              },
                              onLongPress: () {
                                set(() {
                                  if (selected
                                      .contains(imgs[((i * count) + j)])) {
                                    selected.remove(imgs[((i * count) + j)]);
                                  } else {
                                    if (selected.length <= 7) {
                                      selected.add(imgs[((i * count) + j)]);
                                    }
                                  }
                                });
                                onSelect(selected);
                              },
                              child: Stack(children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: children[((i * count) + j)],
                                ),
                                if ((imgs.length - 1) >= ((i * count) + j))
                                  if (selected
                                      .contains(imgs[((i * count) + j)]))
                                    Positioned.fill(
                                        child: Container(
                                      padding: EdgeInsets.all(10.r),
                                      color: Colors.black.withOpacity(0.4),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.done,
                                          color: Colors.white,
                                          size: 24.r,
                                        ),
                                      ),
                                    ))
                              ]));
                        }))
                      : Expanded(child: Container())
              ],
            ),
          )
      ],
    ),
  ));
}
