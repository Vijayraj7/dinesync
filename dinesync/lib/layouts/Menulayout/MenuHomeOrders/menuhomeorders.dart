// import 'dart:math';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_tts/flutter_tts.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:intl/intl.dart';
// import 'package:dinesync/Database/Fire/fireDB.dart';
// import 'package:dinesync/Database/dataposting.dart';
// // import 'package:dinesync/FireFCM/firefcm.dart';
// // import 'package:dinesync/Layouts/Mapicker/mapicker.dart';
// import 'package:dinesync/Layouts/Menulayout/MenuHomeOrders/homedeliveryanalytics.dart';
// import 'package:dinesync/Layouts/Menulayout/menulayout.dart';
// // import 'package:dinesync/Layouts/OrderPage/orderdetailpage.dart';
// // import 'package:dinesync/Layouts/OrderhomeLayout/orderhomelayout.dart';
// // import 'package:dinesync/Layouts/OrderPage/productLayout.dart';
// // import 'package:dinesync/Models/workspotsBranch.dart';
// import 'package:dinesync/Models/workspotsMenu.dart';
// // import 'package:dinesync/Models/workspotsMenuhomeDelivery.dart';
// // import 'package:dinesync/Models/workspotsdeliver.dart';
// // import 'package:dinesync/Models/workspotsMenuOrder.dart';
// import 'package:dinesync/Theme/appbar.dart';
// import 'package:dinesync/Theme/btsheet.dart';
// import 'package:dinesync/Theme/fonts.dart';
// import 'package:dinesync/main.dart';
// // import 'package:dinesync/main/RequestSpotLayout/requestspot.dart';

// class MenuHomeOrderList extends StatefulWidget {
//   const MenuHomeOrderList({super.key, this.qrorder});
//   // final WorkspotsMenuHomeDelivery? qrorder;

//   @override
//   State<MenuHomeOrderList> createState() => _MenuHomeOrderListState();
// }

// class _MenuHomeOrderListState extends State<MenuHomeOrderList> {
//   Future<List<WorkspotsMenuHomeDelivery>> getm() async {
//     var ds = workspotsMenuHomeDeliveryFromJsonList(
//         await FireDB.menuhomeOrderinstance.getallby(
//             {"spotid": WorkControllAdmin.instance.spot.value.id.toString()}));
//     ds.sort(
//       (a, b) {
//         return DateTime.parse(b.createdAt!)
//             .compareTo(DateTime.parse(a.createdAt!));
//       },
//     );
//     return ds;
//   }

//   sectAfterorder(WorkspotsMenuHomeDelivery order) {
//     var lis = order.menu;
//     Color sectcolor = Colors.yellow;
//     Color ncolor = Colors.white;
//     Color scolor = Colors.white.withOpacity(0.7);
//     Color pcolor = Colors.white;
//     return Container(
//       margin: EdgeInsets.all(8.h),
//       // decoration: BoxDecoration(
//       //     borderRadius: BorderRadius.circular(10),
//       //     border: Border.all(color: Colors.black)),
//       child: Card(
//         color: Colors.black,
//         child: Container(
//             padding: EdgeInsets.all(8.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   ("Order"),
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                     fontSize: 15.sp,
//                     color: sectcolor,
//                   ),
//                   maxLines: 1,
//                 ),
//                 for (var j = 0; j < lis.menusections![0].menus!.length; j++)
//                   ListTile(
//                     // onTap: () {
//                     //   removeorder(
//                     //       lis.menusections![0], lis.menusections![0].menus![j]);
//                     //   setState(() {});
//                     // },
//                     title: Text(
//                       (lis.menusections![0].menus![j].n ?? "").toCapitalized(),
//                       style: Fonts.normal(
//                           style: TextStyle(
//                         color: ncolor,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w500,
//                       )),
//                     ),
//                     leading: order.menu.menusections![0].menus![j].i != null
//                         ? CircleAvatar(
//                             radius: 20.r,
//                             backgroundImage: CachedNetworkImageProvider(
//                                 order.menu.menusections![0].menus![j].i!),
//                           )
//                         : null,
//                     subtitle: Text(
//                       lis.menusections![0].menus![j].s ?? "",
//                       style: Fonts.normal(
//                           style: TextStyle(
//                         color: scolor,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w400,
//                       )),
//                     ),
//                     trailing: Text(
//                       lis.menusections![0].menus![j].p == null
//                           ? ""
//                           : lis.menusections![0].menus![j].p!.isEmpty
//                               ? ""
//                               : lis.menusections![0].menus![j].p!
//                                       .startsWith(" x ")
//                                   ? lis.menusections![0].menus![j].p!
//                                   : "₹${lis.menusections![0].menus![j].p!}",
//                       style: Fonts.normal(
//                           style: TextStyle(
//                         color: pcolor,
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.w400,
//                       )),
//                     ),
//                   ),
//                 SizedBox(height: 20.h),
//                 Container(
//                   child: Row(
//                     children: [
//                       if (order.val == "f")
//                         OutlinedButton.icon(
//                             onPressed: () async {
//                               await FireDB.menuhomeOrderinstance
//                                   .column('val')
//                                   .row('id', order.id.toString())
//                                   .setstring("r");
//                               await FIREFCM.sendFCMmenurejectOrder(order);
//                               Get.back();
//                               setState(() {});
//                             },
//                             icon: Icon(Icons.delete, color: Colors.red),
//                             label: Text(
//                               "Reject",
//                               style: Fonts.normal(
//                                   style: TextStyle(color: Colors.white)),
//                             )),
//                       // if (order.val == "s")
//                       //   OutlinedButton.icon(
//                       //       onPressed: () async {
//                       //         await FireDB.menuhomeOrderinstance
//                       //             .column('val')
//                       //             .row('id', order.id.toString())
//                       //             .setstring("d");
//                       //         // await FIREFCM.sendFCMrejectOrder(rqst);
//                       //         Get.back();
//                       //         setState(() {});
//                       //       },
//                       //       icon: Icon(Icons.done_all, color: Colors.blue),
//                       //       label: Text(
//                       //         "Delivered",
//                       //         style: Fonts.normal(
//                       //             style: TextStyle(color: Colors.white)),
//                       //       )),
//                       if (order.val == "f")
//                         OutlinedButton.icon(
//                             onPressed: () async {
//                               // await Get.showOverlay(
//                               //   loadingWidget: CircularProgressIndicator(
//                               //       color: Colors.red),
//                               //   asyncFunction: () async {
//                               await FireDB.menuhomeOrderinstance
//                                   .column('val')
//                                   .row('id', order.id.toString())
//                                   .setstring("s", isoverlay: true);
//                               await FIREFCM.sendFCMmenuacceptOrder(order);
//                               var repid = await recretDeliverid(order);
//                               // printer(repid);
//                               order.deliverid = repid;
//                               await FireDB.menuhomeOrderinstance
//                                   .column('deliverid')
//                                   .row('id', order.id.toString())
//                                   .setstring(repid, isoverlay: true);
//                               await FIREFCM.sendFCMhomeDeliverAgent(order);
//                               //   },
//                               // );
//                               Get.back();
//                               setState(() {});
//                             },
//                             icon: Icon(Icons.done, color: Colors.green),
//                             label: Text(
//                               "Accept",
//                               style: Fonts.normal(
//                                   style: TextStyle(color: Colors.white)),
//                             )),
//                     ],
//                   ),
//                 ),
//                 if (order.address != null)
//                   inputcarder(
//                     ListTile(
//                       onTap: () {
//                         Get.to(MapickerLayout(
//                             lat: order.lat, lng: order.lng, toView: true));
//                       },
//                       title: Text(order.address ?? " No Address ",
//                           style: Fonts.secondary(
//                               style: TextStyle(fontSize: 12.sp))),
//                       leading: Icon(
//                         Icons.place_rounded,
//                         size: 25.r,
//                       ),
//                     ),
//                   ),
//               ],
//             )),
//       ),
//     );
//   }

//   @override
//   void setState(fn) {
//     if (mounted) {
//       super.setState(fn);
//     }
//   }

//   Future<String> recretDeliverid(WorkspotsMenuHomeDelivery rqst) async {
//     var branches =
//         await FireDB.menuhomeOrderinstance.getallbydistanceonegetdeliver(
//       clat: double.parse(rqst.lat!),
//       clng: double.parse(rqst.lng!),
//       distance: 7,
//     );
//     return branches;
//   }

//   @override
//   void initState() {
//     super.initState();
//     // setd();
//     WorkControllAdmin.instance.menuLastnotys.listen((p0) {
//       setState(() {});
//     });
//     if (widget.qrorder != null) {
//       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//         openbt(widget.qrorder!);
//       });
//     }
//   }

//   // setd() async {
//   //   now = DateTime.parse(await FireDB.postinstance.getdatenow());
//   // }

//   // DateTime now = DateTime.now();
//   setdate(List<WorkspotsMenuHomeDelivery> lis) async {
//     var now = DateTime.parse(await FireDB.postinstance.getdatenow());
//     // var lowlis = lis
//     //     .where((e) =>
//     var liss = workspotsMenuHomeDeliveryFromJsonList(
//         workspotsMenuHomeDeliveryToJsonList(lis));
//     liss.sort((a, b) {
//       return DateTime.parse(a.createdAt!)
//           .compareTo(DateTime.parse(b.createdAt!));
//     });
//     //         now.difference(DateTime.parse(e.createdAt!)).inHours.abs() > 24)
//     //     .toList();
//     for (var sx in liss) {
//       // if (lowlis.isNotEmpty) {
//       // var sx = lowlis[0];
//       await Future.delayed(Duration(seconds: 3));
//       var dif = now.difference(DateTime.parse(sx.createdAt!)).inHours.abs();
//       if (dif > 23) {
//         var e =
//             await FireDB.menuhomeOrderinstance.del({'id': sx.id.toString()});
//         printer(e);
//         // }
//       }
//     }
//   }

//   // int delivfee = FirebaseRemoteConfig.instance.getInt('deliverfee');
//   openbt(WorkspotsMenuHomeDelivery order) {
//     double paymen = 0;
//     double delivfee = 0;
//     int payment = 0;
//     for (var it in order.menu.menusections![0].menus!) {
//       var pr = it.p!.split("x").first;
//       var qn = it.p!.split("x").last;
//       if (double.tryParse(pr) != null) {
//         var payn = double.parse(pr) * double.parse(qn);
//         paymen += payn;
//       }
//     }
//     if (order.spotfee != null) {
//       if (int.tryParse(order.spotfee!) != null) {
//         paymen = int.parse(order.spotfee!).toDouble();
//         delivfee = int.parse(order.deliverfee!).toDouble();
//       }
//     }
//     btSheet(
//       tobottom: true,
//       children: [
//         sectAfterorder(order),
//         Center(
//           child:
//               Text(DateFormat.yMMMd().format(DateTime.parse(order.createdAt!))),
//         ),
//         Center(
//           child: Text(
//               DateFormat("hh:mm a").format(DateTime.parse(order.createdAt!))),
//         ),
//         SizedBox(height: 10.h), deliv(order.val),
//         SizedBox(height: 10.h),
//         Center(
//           child: Text(
//             "${order.menu.menusections![0].menus!.length} products",
//             style: Fonts.normal(style: TextStyle(color: Colors.red)),
//           ),
//         ),
//         // leftright("product fee", "₹$paymen"),
//         // leftright("deliver fee", "₹$delivfee"),
//         if (order.paystatus == "s")
//           leftright("payment status", "success", color: Colors.green),
//         // leftright("Details", "",
//         //     trail: TextButton(
//         //         onPressed: () {
//         //           Get.to(OrderMenuHomeLayout(
//         //               sectafter: sectAfterorder(order),
//         //               hom: order,
//         //               spo: WorkControllAdmin.instance.spot.value,
//         //               onClick: (c) {}));
//         //         },
//         //         child: Text("more"))),
//         SizedBox(height: 15.h),
//         if (order.spotfee != null)
//           if (int.tryParse(order.spotfee!) != null)
//             Container(
//               width: 200.w,
//               child: ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(shape: StadiumBorder()),
//                   onPressed: () {
//                     Get.back();
//                     Get.to(OrderMenuHomeLayout(
//                         sectafter: sectAfterorder(order),
//                         hom: order,
//                         spo: WorkControllAdmin.instance.spot.value,
//                         onClick: (c) {}));
//                   },
//                   icon: Icon(Icons.arrow_forward_rounded),
//                   label: Text("Order Details")),
//             ),
//         // ),
//         SizedBox(height: 55.h),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: appBar(title: "Menu Home Orders", actions: [
//         IconButton(
//             onPressed: () async {
//               // double volume = 1.0;
//               // double pitch = 1.0;
//               // double rate = 0.5; //speed
//               Get.to(HomeDeliveryAnalytics());
//               // FlutterTts ft = FlutterTts();
//               // await ft.setVolume(volume);
//               // await ft.setSpeechRate(rate);
//               // await ft.setPitch(pitch);
//               // await ft.setLanguage("en");
//               // for (var r = 0; r < (GetStorage().read("ttsrpt") ?? 2); r++) {
//               // await ft.speak("hii");
//             },
//             icon: Icon(Icons.analytics_outlined)),
//         IconButton(
//             onPressed: () async {
//               // if (!WorkControllAdmin.instance.isexpired.value) {
//               WorkspotsMenu menu = workspotsMenuFromJson(
//                   await FireDB.menuinstance.getoneby({
//                 "spotid": WorkControllAdmin.instance.spot.value.id.toString()
//               }));
//               btSheet(children: [
//                 StatefulBuilder(builder: (c, seter) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         child: SwitchListTile(
//                           onChanged: (s) async {
//                             // await Get.to(ReqMembersView(section: section));
//                             if (menu.isorder!) {
//                               await FireDB.menuinstance
//                                   .column('isorder')
//                                   .row('id', menu.id.toString())
//                                   .setstring("f");
//                             } else {
//                               await FireDB.menuinstance
//                                   .column('isorder')
//                                   .row('id', menu.id.toString())
//                                   .setstring("s");
//                             }
//                             menu = workspotsMenuFromJson(
//                                 await FireDB.menuinstance.getoneby({
//                               "spotid": WorkControllAdmin.instance.spot.value.id
//                                   .toString()
//                             }));
//                             seter(() {});
//                           },
//                           title: Text(
//                               menu.isorder! ? "Order enabled" : "Order closed"),
//                           // groupValue: null,
//                           value: menu.isorder ?? true,

//                           // subtitle: Text(section.about ?? ""),
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         child: SwitchListTile(
//                           onChanged: (s) async {
//                             // await Get.to(ReqMembersView(section: section));
//                             // if ((GetStorage().read("ttsnoty") ?? true)) {
//                             GetStorage().write("ttsnoty", s);
//                             // } else {
//                             //   GetStorage().write("ttsnoty", s);
//                             // }
//                             seter(() {});
//                           },
//                           title: Text((GetStorage().read("ttsnoty") ?? true)
//                               ? "Notification voice enabled"
//                               : "Notification voice disabled"),
//                           // groupValue: null,
//                           value: (GetStorage().read("ttsnoty") ?? true),

//                           // subtitle: Text(section.about ?? ""),
//                         ),
//                       ),
//                       PopupMenuButton<String>(
//                         child: ListTile(
//                           title: Text(
//                               (GetStorage().read("ttslng") ?? "e") == "e"
//                                   ? "English"
//                                   : "Malayalam"),
//                           subtitle: Text("order voice language"),
//                         ),
//                         initialValue: GetStorage().read("ttslng") ?? "e",
//                         // Callback that sets the selected popup menu item.
//                         onSelected: (String item) {
//                           // setState(() {
//                           GetStorage().write("ttslng", item);
//                           seter(() {});
//                           // });
//                         },
//                         itemBuilder: (BuildContext context) =>
//                             <PopupMenuEntry<String>>[
//                           const PopupMenuItem<String>(
//                             value: "e",
//                             child: Text('English'),
//                           ),
//                           const PopupMenuItem<String>(
//                             value: "m",
//                             child: Text('Malayalam'),
//                           ),
//                         ],
//                       ),
//                       // PopupMenuButton<int>(
//                       //   child: ListTile(
//                       //     title: Text((GetStorage().read("ttsrpt") ?? 2) == 1
//                       //         ? "1 Times"
//                       //         : "2 Times"),
//                       //     subtitle: Text("Voice repeat"),
//                       //   ),
//                       //   initialValue: GetStorage().read("ttsrpt") ?? 2,
//                       //   // Callback that sets the selected popup menu item.
//                       //   onSelected: (int item) {
//                       //     // setState(() {
//                       //     GetStorage().write("ttsrpt", item);
//                       //     seter(() {});
//                       //     // });
//                       //   },
//                       //   itemBuilder: (BuildContext context) =>
//                       //       <PopupMenuEntry<int>>[
//                       //     const PopupMenuItem<int>(
//                       //       value: 1,
//                       //       child: Text('1 Times'),
//                       //     ),
//                       //     const PopupMenuItem<int>(
//                       //       value: 2,
//                       //       child: Text('2 Times'),
//                       //     ),
//                       //   ],
//                       // ),
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         child: SwitchListTile(
//                           onChanged: (s) async {
//                             // await Get.to(ReqMembersView(section: section));
//                             // if ((GetStorage().read("ttsall") ?? true)) {
//                             GetStorage().write("ttsall", s);
//                             // } else {
//                             //   GetStorage().write("ttsall", true);
//                             // }
//                             seter(() {});
//                           },
//                           title: Text((GetStorage().read("ttsall") ?? true)
//                               ? "All food be said by voice enabled"
//                               : "All food be said by voice disabled"),
//                           // groupValue: null,
//                           value: (GetStorage().read("ttsall") ?? true),

//                           // subtitle: Text(section.about ?? ""),
//                         ),
//                       ),
//                       SizedBox(height: 60.h),
//                     ],
//                   );
//                 })
//               ]);
//               // }
//             },
//             icon: Icon(Icons.settings, color: Colors.white))
//       ]),
//       body: Container(
//           child: SingleChildScrollView(
//         child: FutureBuilder(
//           key: ValueKey(Random().nextInt(10000).toString()),
//           future: getm(),
//           builder: (c, s) {
//             if (s.hasData) {
//               var menlis = s.data!;
//               // setdatex(menlis);
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   for (var order in menlis)
//                     Container(
//                         decoration: BoxDecoration(
//                           border: Border(
//                             bottom: BorderSide(color: Colors.grey[700]!),
//                           ),
//                         ),
//                         child: ListTile(
//                             onTap: () async {
//                               openbt(order);
//                             },
//                             title: Text(
//                               order.menu.menusections![0].menus![0].n
//                                       .toString() +
//                                   "....etc",
//                               style: Fonts.title(
//                                   style: TextStyle(color: Colors.white)),
//                             ),
//                             subtitle: Text(
//                               "${order.menu.menusections![0].menus!.length} products",
//                               style: Fonts.pricetitle(
//                                   style: TextStyle(color: Colors.red[400])),
//                             ),
//                             trailing: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   DateFormat.yMMMd()
//                                       .format(DateTime.parse(order.createdAt!)),
//                                   style: Fonts.normal(
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 9.sp)),
//                                 ),
//                                 Text(
//                                   DateFormat("hh:mm a")
//                                       .format(DateTime.parse(order.createdAt!)),
//                                   style: Fonts.normal(
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 9.sp)),
//                                 ),
//                                 SizedBox(height: 4.h),
//                                 deliv(order.val, align: null),
//                               ],
//                             ))),
//                   SizedBox(
//                     height: 300.h,
//                   )
//                 ],
//               );
//             } else {
//               return Container(
//                 height: 200.h,
//                 child: Center(
//                   child: CircularProgressIndicator(
//                     strokeWidth: 2,
//                     color: Colors.white,
//                   ),
//                 ),
//               );
//             }
//           },
//         ),
//       )),
//     );
//   }
// }

// Widget deliv(String? val, {AlignmentGeometry? align = Alignment.center}) {
//   return Container(
//     alignment: align,
//     child: val == null
//         ? Text(
//             "Not Delivered",
//             style: Fonts.normal(style: TextStyle(color: Colors.blue)),
//           )
//         : val == "di"
//             ? Text(
//                 "Dispatched",
//                 style: Fonts.normal(style: TextStyle(color: Colors.yellow)),
//               )
//             : val == "c"
//                 ? Text(
//                     "Cancelled",
//                     style: Fonts.normal(style: TextStyle(color: Colors.red)),
//                   )
//                 : val == "s"
//                     ? Text(
//                         "Accepted",
//                         style:
//                             Fonts.normal(style: TextStyle(color: Colors.green)),
//                       )
//                     : val == "f"
//                         ? Text(
//                             "Not Delivered",
//                             style: Fonts.normal(
//                                 style: TextStyle(color: Colors.blue)),
//                           )
//                         : val == "d"
//                             ? Text(
//                                 "Delivered",
//                                 style: Fonts.normal(
//                                     style: TextStyle(color: Colors.green)),
//                               )
//                             : val == "r"
//                                 ? Text(
//                                     "Rejected",
//                                     style: Fonts.normal(
//                                         style: TextStyle(color: Colors.red)),
//                                   )
//                                 : Text(
//                                     "Rejected",
//                                     style: Fonts.normal(
//                                         style: TextStyle(color: Colors.red)),
//                                   ),
//   );
// }
