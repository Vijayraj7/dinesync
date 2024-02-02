import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:dinesync/Database/dataposting.dart';
// import 'package:dinesync/Layouts/MenuLayout/menulayout.dart';
import 'package:dinesync/Models/workspotsMenu.dart';
// import 'package:workspots/Layouts/SpotLayout/smainl.dart';
// import 'package:dinesync/Models/workspotsSpots.dart';
// import 'package:dinesync/Database/encapp.dart';
import 'package:http/http.dart' as http;
import 'package:dinesync/Theme/fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dinesync/Theme/images.dart';

class MenuQrCard extends StatefulWidget {
  MenuQrCard({super.key, required this.menu});
  WorkspotsMenu menu;

  @override
  State<MenuQrCard> createState() => _MenuQrCardState(menu);
}

class _MenuQrCardState extends State<MenuQrCard> {
  _MenuQrCardState(this.menu);
// WidgetsToImageController to access widget
  WorkspotsMenu menu;
  // WidgetsToImageController controller = WidgetsToImageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await Get.showOverlay(
            opacity: 0.4,
            loadingWidget: loader(),
            asyncFunction: () async {
              await shareMenu(menu);
            },
          );
        },
        child: Scaffold(
            backgroundColor: Colors.black,
            // height: 200.0,
            // color: Colors.white,
            body: Container(
                // width: 200.w,
                // color: Colors.white,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // QrImage(
                    //   backgroundColor:
                    //       Colors.white,
                    //   data:
                    //       "https//workspots.in/spot/${stringAppEncryption(spot.id.toString())}",
                    //   version: QrVersions.auto,
                    //   gapless: false,
                    //   // embeddedImage: AssetImage(
                    //   //     'assets/workspotlogo.png'),
                    //   // embeddedImageStyle:
                    //   //     QrEmbeddedImageStyle(
                    //   //   size: Size(80, 80),
                    //   // ),
                    //   size: 250.r,
                    // )

                    Container(
                        width: 300.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          // border: Border.all(
                          //   strokeAlign: BorderSide.strokeAlignOutside,
                          //   color: Colors.black,
                          //   width: 8.w,
                          // )
                        ),
                        // padding: EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // slogo(spot.imgurl, spot.name ?? ""),
                            wlogo(ImageAssets.workspotlogo),
                            SizedBox(height: 25.h),
                            Divider(height: 0.2, color: Colors.grey),
                            SizedBox(height: 13.h),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.menu, color: Colors.white),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "Menu",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 13.h),
                            // Text(
                            //   spot.address ?? "",
                            //   textAlign: TextAlign.center,
                            //   style: Fonts.normal(
                            //       style: TextStyle(color: Colors.black54)),
                            // ),
                            // if (menu.address != null)
                            //   SizedBox(height: 14.h),
                            // slogo(spot.imgurl, spot.name ?? ""),
                            // SizedBox(height: 15.h),
                            // ClipRect(
                            //   child: BackdropFilter(
                            //     filter: ImageFilter.blur(
                            //         sigmaX: 10.0, sigmaY: 10.0),
                            //     child:
                            Card(
                              elevation: 4,
                              // decoration: BoxDecoration(
                              //     // color: Colors.grey.withOpacity(0.7),
                              //     // color: Colors.black,
                              //     borderRadius:
                              //         BorderRadius.circular(10)),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: PrettyQr(
                                  elementColor: Colors.black,
                                  // image:
                                  //     AssetImage(ImageAssets.worksblack),
                                  // image: CachedNetworkImageProvider(
                                  //     spot.imgurl!),
                                  typeNumber: null,
                                  size: 250.w,
                                  data:
                                      "https://workspots.in/me/${menu.uid.toString()}",
                                  errorCorrectLevel: QrErrorCorrectLevel.Q,
                                  roundEdges: true,
                                ),
                              ),
                            ),
                            //   ),
                            // ),
                            // Container(
                            //   child: Row(
                            //     children: [
                            //       Image.asset(
                            //         ImageAssets.workspotlogo,
                            //         width: 15.w,
                            //         height: 15.w,
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            // SizedBox(height: 25.h),
                            // Divider(height: 0.2, color: Colors.grey),
                            // SizedBox(height: 8.h),
                            SizedBox(height: 25.h),
                            slogo(menu.img, menu.name ?? ""),
                            SizedBox(height: 8.h),
                            Text("scan this code to view menu",
                                style: Fonts.normal(
                                  style: TextStyle(
                                      color: Colors.white54,
                                      // fontWeight: FontWeight.w500,
                                      fontSize: 15.sp),
                                ))
                            // Container(
                            //   padding: EdgeInsets.symmetric(vertical: 15.h),
                            //   color: Colors.black,
                            //   // contentPadding:
                            //   //     EdgeInsets
                            //   //         .symmetric(
                            //   //             horizontal:
                            //   //                 0.w),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text("SCAN ME",
                            //           style: Fonts.fprimary(
                            //             style: TextStyle(
                            //                 color: Colors.white,
                            //                 fontWeight: FontWeight.w800,
                            //                 fontSize: 19.sp),
                            //           )),
                            //       // SizedBox(
                            //       //     height:
                            //       //         20.h),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ))
                  ],
                ))));
  }

  wlogo(String? img) {
    return Container(
        // color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        // contentPadding:
        //     EdgeInsets
        //         .symmetric(
        //             horizontal:
        //                 0.w),
        child: Column(children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (img != null)
                  Image.asset(
                    img,
                    width: 70.w,
                    height: 70.w,
                  ),
                if (img == null)
                  CircleAvatar(
                    radius: 40.r,
                    child: Icon(Icons.store),
                  ),
                SizedBox(width: 2.w),
                // SizedBox(height: 6.h),
                Text("Dine sync",
                    style: Fonts.normal(
                      style: TextStyle(
                          color: Colors.white,
                          // color: Color.fromARGB(188, 0, 0, 0),
                          // fontWeight: FontWeight.w800,
                          fontSize: 33.sp),
                    )),
                // SizedBox(height: 5.h),
                // SizedBox(
                //     height:
                //         20.h),
              ],
            ),
          ),
          Text("get store updates",
              style: Fonts.normal(
                style: TextStyle(
                    color: Colors.white54,
                    // fontWeight: FontWeight.w800,
                    fontSize: 14.sp),
              ))
        ]));
  }

  slogo(String? img, String title) {
    return Container(
      // color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      // contentPadding:
      //     EdgeInsets
      //         .symmetric(
      //             horizontal:
      //                 0.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(width: 10.w),
          // if (img != null)
          //   CircleAvatar(
          //       radius: 20.r,
          //       backgroundImage: CachedNetworkImageProvider(
          //         img,
          //       )),
          // if (img == null)
          //   CircleAvatar(
          //     radius: 40.r,
          //     child: Icon(Icons.store),
          //   ),
          // SizedBox(height: 6.h),
          Text(title,
              style: Fonts.normal(
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp),
              )),

          // SizedBox(height: 15.h),

          // SizedBox(
          //     height:
          //         20.h),
        ],
      ),
    );
  }
}

shareMenu(WorkspotsMenu me) async {
  // await FireDB.spotinstance.set(WorkspotsSpots().toJson());
  Get.showOverlay(
    opacity: 0.4,
    loadingWidget: loader(),
    asyncFunction: () async {
      // List<String> uls = [];
      // List<XFile> uls = [];
      // // for (var i = 0; i < post.imgurl!.length; i++) {
      // var i = 0;
      // final url = Uri.parse(me.img!);
      // final response = await http.get(url);
      // final Directory extDir = await getApplicationDocumentsDirectory();
      // var ul = extDir.path +
      //     '/Temp/${me.img!.split("/").last.split(".").first}${Random().nextInt(10000)}.${me.img!.split(".").last}';
      // var isxt = await File(ul).exists();
      // if (!isxt) {
      //   await File(ul).create(recursive: true);
      // }
      // await File(ul).writeAsBytes(response.bodyBytes);
      // // uls.add(ul);
      // uls.add(XFile(ul));
      // }
      // uls.add(widget.post.imgurl![0]);
      var txt = """
${me.name ?? ""}
.
click this link to view the Menu 👇
.
.
Workspots
https://workspots.in/me/${me.uid.toString()}
                                  """;

      txt = txt.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), '\n');
      printer(
        me.uid.toString(),
      );
      // sr.AkvelonFlutterSharePlugin.
      // await AkvelonFlutterSharePlugin.shareMultiple(
      //   uls,
      //   ShareType.IMAGE,
      //   text: txt,
      //   subject: post.name,
      // );
      // await Share.shareXFiles(
      //   uls,
      //   text: txt,
      //   subject: me.name,
      // );
      // sharePositionOrigin: Rect.fromCircle(
      //     center: Offset(0, 0), radius: 2),
    },
  );
}
