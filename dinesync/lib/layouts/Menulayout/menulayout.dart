import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
// import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:dinesync/Database/Fire/fireDB.dart';
import 'package:dinesync/Database/dataposting.dart';
// import 'package:dinesync/Layouts/EventLayout/eventviewlayout.dart';
import 'package:dinesync/Layouts/MenuLayout/QrCard/qrcard.dart';
// import 'package:dinesync/Layouts/SpotLayout/spotlayout.dart';
import 'package:dinesync/Models/workspotsMenu.dart';
// import 'package:dinesync/Models/workspotsSpots.dart';
import 'package:dinesync/Theme/appbar.dart';
import 'package:dinesync/Theme/fonts.dart';
import 'package:dinesync/Theme/showsnack.dart';
import 'package:dinesync/Theme/textfiealds.dart';
// import 'package:dinesync/WorkControllAdmin.dart';

class MenuLayout extends StatefulWidget {
  const MenuLayout({super.key, required this.menu, this.onSelect});
  final void Function(String s)? onSelect;
  final WorkspotsMenu menu;

  @override
  State<MenuLayout> createState() => _MenuLayoutState(menu);
}

class _MenuLayoutState extends State<MenuLayout> {
  _MenuLayoutState(this.menu);
  WorkspotsMenu menu;
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      // sets();
    }
  }

  // WorkspotsSpots? spot;
  // sets() async {
  //   spot = WorkControllAdmin.instance.spot.value;
  //   if (mounted) {
  //     setState(() {
  //       spot = spot;
  //       if (menu.desid != null) {
  //         ran = int.parse(menu.desid ?? "3");
  //       }
  //     });
  //   }
  // }

  int ran = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.onSelect != null
          ? FloatingActionButton.extended(
              backgroundColor: Colors.blue,
              onPressed: () {
                setState(() {
                  if (ran == 6) {
                    ran = 1;
                  } else {
                    ran = ran + 1;
                  }
                });
              },
              label: Text("Change Style"))
          : null,
      appBar: appBar(
        title: "Menu",
        actions: [
          if (menu.id != null)
            IconButton(
              onPressed: () {
                Get.to(MenuQrCard(menu: menu));
              },
              icon: Icon(Icons.share),
            ),
          IconButton(
            onPressed: () {
              if (widget.onSelect != null) {
                widget.onSelect!(ran.toString());
              }
            },
            icon: Icon(Icons.done_all),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.red),
        child: Stack(
          children: [
            // Positioned.fill(
            //     child: menu.backimg!.startsWith("http")
            //         ? CachedNetworkImage(
            //             imageUrl: menu.backimg!,
            //             fit: BoxFit.cover,
            //           )
            //         : Image.file(
            //             File(menu.backimg!),
            //             fit: BoxFit.cover,
            //           )),
            Positioned.fill(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 300.h,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            if (menu.img != null)
                              if (menu.img!.startsWith("http"))
                                Positioned.fill(
                                  child: CachedNetworkImage(
                                    imageUrl: menu.img!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            if (menu.img != null)
                              if (!menu.img!.startsWith("http"))
                                Positioned.fill(
                                  child: Image.file(
                                    File(menu.img!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            Positioned.fill(
                              child: Container(
                                height: 300.h,
                                color: Colors.black.withOpacity(0.4),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextField(
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 31.sp),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        maxLength: 20,
                                        controller: TextEditingController(
                                            text: menu.name ?? ""),
                                        decoration: InputDecoration(
                                            hintText: "Title",
                                            counterText: "",
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontSize: 31.sp),
                                            border: InputBorder.none),
                                        onChanged: (s) {
                                          menu.name = s;
                                        },
                                      ),
                                      // Card(
                                      //   child: Container(
                                      //     padding: EdgeInsets.all(10),
                                      //     child:
                                      SizedBox(height: 15.h),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "order can be created by clicking on each item",
                        style: Fonts.normal(
                            style: TextStyle(
                                color: Colors.white54, fontSize: 14.sp)),
                      ),
                      for (var i = 0; i < menu.menusections!.length; i++)
                        menusect(i),
                      SizedBox(height: 200.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  menusect(int i) {
    if (ran == null) {
      return menusect1(i);
    } else if (ran == 1) {
      return menusect1(i);
    } else if (ran == 2) {
      return menusect2(i);
    } else if (ran == 3) {
      return menusect3(i);
    } else if (ran == 4) {
      return menusect4(i);
    } else if (ran == 5) {
      return menusect5(i);
    } else if (ran == 6) {
      return menusect6(i);
    }
  }

  menusect1(int i) {
    Color sectcolor = Colors.red;
    Color ncolor = Colors.white;
    Color scolor = Colors.white.withOpacity(0.7);
    Color pcolor = Colors.white;
    return Container(
      margin: EdgeInsets.all(8.h),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(color: Colors.black)),
      child: Card(
        color: Colors.black,
        child: Container(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (menu.menusections![i].name ?? "").toCapitalized(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: sectcolor,
                  ),
                  maxLines: 1,
                ),
                for (var j = 0; j < menu.menusections![i].menus!.length; j++)
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Expanded(
                  //       flex: 3,
                  //       child: Text(
                  //         menu.menusections![i].menus![j].n ?? "",
                  //         // onChanged: (s) {
                  //         //   menu.menusections![i].menus![j].n = s;
                  //         // },
                  //         // maxLength: 20,
                  //         style: TextStyle(fontSize: 12.sp),
                  //         // decoration: InputDecoration(
                  //         //     counterText: "",
                  //         //     hintStyle: TextStyle(fontSize: 12.sp),
                  //         //     border: InputBorder.none,
                  //         //     hintText: "name"),
                  //         textAlign: TextAlign.start,
                  //         // autofocus: true,
                  //         // keyboardType: TextInputType.name,
                  //         maxLines: 1,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 3,
                  //       child: TextField(
                  //         controller: TextEditingController(
                  //             text: menu.menusections![i].menus![j].s ?? ""),
                  //         onChanged: (s) {
                  //           menu.menusections![i].menus![j].s = s;
                  //         },
                  //         maxLength: 20,
                  //         style: TextStyle(fontSize: 12.sp),
                  //         decoration: InputDecoration(
                  //             counterText: "",
                  //             hintStyle: TextStyle(fontSize: 12.sp),
                  //             border: InputBorder.none,
                  //             hintText: "subtitle"),
                  //         textAlign: TextAlign.start,
                  //         // autofocus: true,
                  //         keyboardType: TextInputType.name,
                  //         maxLines: 1,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 3,
                  //       child: TextField(
                  //         // style: TextStyle(fontSize: 12.sp),
                  //         controller: TextEditingController(
                  //             text: menu.menusections![i].menus![j].p ?? ""),
                  //         onChanged: (s) {
                  //           menu.menusections![i].menus![j].p = s;
                  //         },
                  //         maxLength: 20,
                  //         style: TextStyle(fontSize: 12.sp),
                  //         decoration: InputDecoration(
                  //             counterText: "",
                  //             hintStyle: TextStyle(fontSize: 12.sp),
                  //             border: InputBorder.none,
                  //             hintText: "Price"),
                  //         textAlign: TextAlign.start,
                  //         // autofocus: true,
                  //         keyboardType: TextInputType.name,
                  //         maxLines: 1,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ListTile(
                    title: Text(
                      (menu.menusections![i].menus![j].n ?? "").toCapitalized(),
                      style: Fonts.normal(
                          style: TextStyle(
                        color: ncolor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    subtitle: Text(
                      menu.menusections![i].menus![j].s ?? "",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: scolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    trailing: Text(
                      menu.menusections![i].menus![j].p == null
                          ? ""
                          : menu.menusections![i].menus![j].p!.isEmpty
                              ? ""
                              : "₹${menu.menusections![i].menus![j].p!}",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: pcolor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                  ),
                // trailing: TextField(
                //   controller: TextEditingController(
                //       text: menu.menusections![i].menus![j].s ?? ""),
                //   onChanged: (s) {
                //     menu.menusections![i].menus![j].s = s;
                //   },
                //   maxLength: 20,
                //   style: TextStyle(fontSize: 17.sp),
                //   decoration: InputDecoration(
                //       counterText: "",
                //       hintStyle: TextStyle(fontSize: 17.sp),
                //       border: InputBorder.none,
                //       hintText: "subtitle"),
                //   // autofocus: true,
                //   keyboardType: TextInputType.name,
                //   maxLines: 1,
                // ),

                // Container(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Container(
                //         child: Column(children: [
                //           TextField(
                //             controller: TextEditingController(
                //                 text: menu.menusections![i].menus![j].n ?? ""),
                //             onChanged: (s) {
                //               menu.menusections![i].menus![j].n = s;
                //             },
                //             maxLength: 20,
                //             style: TextStyle(fontSize: 17.sp),
                //             decoration: InputDecoration(
                //                 counterText: "",
                //                 hintStyle: TextStyle(fontSize: 17.sp),
                //                 border: InputBorder.none,
                //                 hintText: "name"),
                //             // autofocus: true,
                //             keyboardType: TextInputType.name,
                //             maxLines: 1,
                //           ),
                //           TextField(
                //             controller: TextEditingController(
                //                 text: menu.menusections![i].menus![j].s ?? ""),
                //             onChanged: (s) {
                //               menu.menusections![i].menus![j].s = s;
                //             },
                //             maxLength: 20,
                //             style: TextStyle(fontSize: 17.sp),
                //             decoration: InputDecoration(
                //                 counterText: "",
                //                 hintStyle: TextStyle(fontSize: 17.sp),
                //                 border: InputBorder.none,
                //                 hintText: "subtitle"),
                //             // autofocus: true,
                //             keyboardType: TextInputType.name,
                //             maxLines: 1,
                //           ),
                //           // Text(menu.menusections![i].menus![j].n!),
                //           // Text(menu.menusections![i].menus![j].s!)
                //         ]),
                //       ),
                //       TextField(
                //         controller: TextEditingController(
                //             text: menu.menusections![i].menus![j].p ?? ""),
                //         onChanged: (s) {
                //           menu.menusections![i].menus![j].p = s;
                //         },
                //         maxLength: 20,
                //         style: TextStyle(fontSize: 17.sp),
                //         decoration: InputDecoration(
                //             counterText: "",
                //             hintStyle: TextStyle(fontSize: 17.sp),
                //             border: InputBorder.none,
                //             hintText: "subtitle"),
                //         // autofocus: true,
                //         keyboardType: TextInputType.name,
                //         maxLines: 1,
                //       ),
                //       // Text(menu.menusections![i].menus![j].p!)
                //     ],
                //   ),
                // ),
                SizedBox(height: 10.h),
              ],
            )),
      ),
    );
  }

  menusect2(int i) {
    Color sect2color = Colors.orange[600]!;
    Color n2color = Colors.orange[100]!;
    Color s2color = Colors.orange[100]!.withOpacity(0.7);
    Color p2color = Colors.orange[100]!;
    return Container(
      margin: EdgeInsets.all(8.h),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(color: Colors.black)),
      child: Card(
        color: Colors.black,
        child: Container(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (menu.menusections![i].name ?? "").toCapitalized(),
                  textAlign: TextAlign.start,
                  style: Fonts.fsecondary(
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: sect2color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  maxLines: 1,
                ),
                for (var j = 0; j < menu.menusections![i].menus!.length; j++)
                  ListTile(
                    title: Text(
                      (menu.menusections![i].menus![j].n ?? "").toCapitalized(),
                      style: Fonts.fprimary(
                          style: TextStyle(
                        color: n2color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    subtitle: Text(
                      menu.menusections![i].menus![j].s ?? "",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: s2color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    trailing: Text(
                      menu.menusections![i].menus![j].p == null
                          ? ""
                          : menu.menusections![i].menus![j].p!.isEmpty
                              ? ""
                              : "₹${menu.menusections![i].menus![j].p!}",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: p2color,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                  ),
                // trailing: TextField(
                //   controller: TextEditingController(
                //       text: menu.menusections![i].menus![j].s ?? ""),
                //   onChanged: (s) {
                //     menu.menusections![i].menus![j].s = s;
                //   },
                //   maxLength: 20,
                //   style: TextStyle(fontSize: 17.sp),
                //   decoration: InputDecoration(
                //       counterText: "",
                //       hintStyle: TextStyle(fontSize: 17.sp),
                //       border: InputBorder.none,
                //       hintText: "subtitle"),
                //   // autofocus: true,
                //   keyboardType: TextInputType.name,
                //   maxLines: 1,
                // ),

                // Container(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Container(
                //         child: Column(children: [
                //           TextField(
                //             controller: TextEditingController(
                //                 text: menu.menusections![i].menus![j].n ?? ""),
                //             onChanged: (s) {
                //               menu.menusections![i].menus![j].n = s;
                //             },
                //             maxLength: 20,
                //             style: TextStyle(fontSize: 17.sp),
                //             decoration: InputDecoration(
                //                 counterText: "",
                //                 hintStyle: TextStyle(fontSize: 17.sp),
                //                 border: InputBorder.none,
                //                 hintText: "name"),
                //             // autofocus: true,
                //             keyboardType: TextInputType.name,
                //             maxLines: 1,
                //           ),
                //           TextField(
                //             controller: TextEditingController(
                //                 text: menu.menusections![i].menus![j].s ?? ""),
                //             onChanged: (s) {
                //               menu.menusections![i].menus![j].s = s;
                //             },
                //             maxLength: 20,
                //             style: TextStyle(fontSize: 17.sp),
                //             decoration: InputDecoration(
                //                 counterText: "",
                //                 hintStyle: TextStyle(fontSize: 17.sp),
                //                 border: InputBorder.none,
                //                 hintText: "subtitle"),
                //             // autofocus: true,
                //             keyboardType: TextInputType.name,
                //             maxLines: 1,
                //           ),
                //           // Text(menu.menusections![i].menus![j].n!),
                //           // Text(menu.menusections![i].menus![j].s!)
                //         ]),
                //       ),
                //       TextField(
                //         controller: TextEditingController(
                //             text: menu.menusections![i].menus![j].p ?? ""),
                //         onChanged: (s) {
                //           menu.menusections![i].menus![j].p = s;
                //         },
                //         maxLength: 20,
                //         style: TextStyle(fontSize: 17.sp),
                //         decoration: InputDecoration(
                //             counterText: "",
                //             hintStyle: TextStyle(fontSize: 17.sp),
                //             border: InputBorder.none,
                //             hintText: "subtitle"),
                //         // autofocus: true,
                //         keyboardType: TextInputType.name,
                //         maxLines: 1,
                //       ),
                //       // Text(menu.menusections![i].menus![j].p!)
                //     ],
                //   ),
                // ),
                SizedBox(height: 10.h),
              ],
            )),
      ),
    );
  }

  menusect3(int i) {
    Color sect2color = Colors.green[600]!;
    Color n2color = Colors.green[100]!;
    Color s2color = Colors.green[100]!.withOpacity(0.7);
    Color p2color = Colors.green[100]!;
    return Container(
      margin: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: Card(
        color: Colors.black,
        child: Container(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (menu.menusections![i].name ?? "").toCapitalized(),
                  textAlign: TextAlign.start,
                  style: Fonts.abril(
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: sect2color,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  maxLines: 1,
                ),
                for (var j = 0; j < menu.menusections![i].menus!.length; j++)
                  ListTile(
                    title: Text(
                      (menu.menusections![i].menus![j].n ?? "").toCapitalized(),
                      style: Fonts.pricetitle(
                          style: TextStyle(
                        color: n2color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    subtitle: Text(
                      menu.menusections![i].menus![j].s ?? "",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: s2color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    trailing: Text(
                      menu.menusections![i].menus![j].p == null
                          ? ""
                          : menu.menusections![i].menus![j].p!.isEmpty
                              ? ""
                              : "₹${menu.menusections![i].menus![j].p!}",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: p2color,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                  ),
                SizedBox(height: 10.h),
              ],
            )),
      ),
    );
  }

  menusect4(int i) {
    Color sect2color = Colors.pink[600]!;
    Color n2color = Colors.pink[100]!;
    Color s2color = Colors.pink[100]!.withOpacity(0.7);
    Color p2color = Colors.pink[100]!;
    return Container(
      margin: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(65), topRight: Radius.circular(10)),
          border: Border.all(color: sect2color)),
      child: Card(
        color: Colors.black,
        child: Container(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (menu.menusections![i].name ?? "").toCapitalized(),
                  textAlign: TextAlign.start,
                  style: Fonts.abril(
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: sect2color,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  maxLines: 1,
                ),
                for (var j = 0; j < menu.menusections![i].menus!.length; j++)
                  ListTile(
                    title: Text(
                      (menu.menusections![i].menus![j].n ?? "").toCapitalized(),
                      style: Fonts.title(
                          style: TextStyle(
                        color: n2color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    subtitle: Text(
                      menu.menusections![i].menus![j].s ?? "",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: s2color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    trailing: Text(
                      menu.menusections![i].menus![j].p == null
                          ? ""
                          : menu.menusections![i].menus![j].p!.isEmpty
                              ? ""
                              : "₹${menu.menusections![i].menus![j].p!}",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: p2color,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                  ),
                SizedBox(height: 10.h),
              ],
            )),
      ),
    );
  }

  menusect5(int i) {
    Color sect2color = Colors.blue[700]!;
    Color n2color = Colors.blue[100]!;
    Color s2color = Colors.blue[100]!.withOpacity(0.7);
    Color p2color = Colors.blue[100]!;
    return Container(
      margin: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(65), topRight: Radius.circular(10)),
          // border: Border.all(color: sect2color),
          ),
      child: DottedBorder(
        strokeCap: StrokeCap.round,
        dashPattern: [10, 10],
        color: Colors.black,
        strokeWidth: 1,
        radius: Radius.circular(10),
        child: Card(
          color: Colors.black,
          child: Container(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (menu.menusections![i].name ?? "").toCapitalized(),
                    textAlign: TextAlign.start,
                    style: Fonts.fsecondary(
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: sect2color,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    maxLines: 1,
                  ),
                  for (var j = 0; j < menu.menusections![i].menus!.length; j++)
                    ListTile(
                      title: Text(
                        (menu.menusections![i].menus![j].n ?? "")
                            .toCapitalized(),
                        style: Fonts.title(
                            style: TextStyle(
                          color: n2color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                      subtitle: Text(
                        menu.menusections![i].menus![j].s ?? "",
                        style: Fonts.normal(
                            style: TextStyle(
                          color: s2color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        )),
                      ),
                      trailing: Text(
                        menu.menusections![i].menus![j].p == null
                            ? ""
                            : menu.menusections![i].menus![j].p!.isEmpty
                                ? ""
                                : "₹${menu.menusections![i].menus![j].p!}",
                        style: Fonts.normal(
                            style: TextStyle(
                          color: p2color,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        )),
                      ),
                    ),
                  SizedBox(height: 10.h),
                ],
              )),
        ),
      ),
    );
  }

  menusect6(int i) {
    Color sect2color = Colors.blue[700]!;
    Color n2color = Colors.blue[100]!;
    Color s2color = Colors.blue[100]!.withOpacity(0.7);
    Color p2color = Colors.blue[100]!;
    return Container(
      margin: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(65), topRight: Radius.circular(10)),
          // border: Border.all(color: sect2color),
          ),
      child: Card(
        color: Colors.black,
        child: Container(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (menu.menusections![i].name ?? "").toCapitalized(),
                  textAlign: TextAlign.start,
                  style: Fonts.fsecondary(
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: sect2color,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  maxLines: 1,
                ),
                for (var j = 0; j < menu.menusections![i].menus!.length; j++)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    margin: EdgeInsets.all(6.r),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (menu.menusections![i].menus![j].i != null)
                              Container(
                                height: 90.w,
                                width: 90.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        menu.menusections![i].menus![j].i!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    (menu.menusections![i].menus![j].n ?? "")
                                        .toCapitalized(),
                                    style: Fonts.title(
                                        style: TextStyle(
                                      color: n2color,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Text(
                                    menu.menusections![i].menus![j].s ?? "",
                                    style: Fonts.normal(
                                        style: TextStyle(
                                      color: s2color,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    menu.menusections![i].menus![j].p == null
                                        ? ""
                                        : menu.menusections![i].menus![j].p!
                                                .isEmpty
                                            ? ""
                                            : "₹${menu.menusections![i].menus![j].p!}",
                                    style: Fonts.normal(
                                        style: TextStyle(
                                      color: p2color,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                  OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                      label: Text("Add"))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 10.h),
              ],
            )),
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
