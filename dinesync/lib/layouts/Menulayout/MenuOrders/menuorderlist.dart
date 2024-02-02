import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinesync/models/workspotsMenuOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:dinesync/Database/Fire/fireDB.dart';
import 'package:dinesync/Database/dataposting.dart';
import 'package:dinesync/Layouts/Menulayout/menulayout.dart';
// import 'package:dinesync/Layouts/PrintTo/printto.dart';
import 'package:dinesync/Models/workspotsMenu.dart';
// import 'package:dinesync/Models/workspotsMenuOrder.dart';
import 'package:dinesync/Theme/appbar.dart';
import 'package:dinesync/Theme/btsheet.dart';
import 'package:dinesync/Theme/fonts.dart';
import 'package:dinesync/main.dart';

class MenuOrderList extends StatefulWidget {
  const MenuOrderList({super.key, this.qrorder});
  final WorkspotsMenuOrder? qrorder;

  @override
  State<MenuOrderList> createState() => _MenuOrderListState();
}

class _MenuOrderListState extends State<MenuOrderList> {
  Future<List<WorkspotsMenuOrder>> getm() async {
    var ds = workspotsMenuOrderFromJsonList(await FireDB.menuOrderinstance
        .getallby({"spotid": WorkControll.instance.user.value.id.toString()}));
    ds.sort(
      (a, b) {
        return DateTime.parse(b.createdAt!)
            .compareTo(DateTime.parse(a.createdAt!));
      },
    );
    return ds;
  }

  sectAfterorder(WorkspotsMenuOrder order) {
    var lis = order.menu;
    Color sectcolor = Colors.yellow;
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
                  ("Order"),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: sectcolor,
                  ),
                  maxLines: 1,
                ),
                for (var j = 0; j < lis.menusections![0].menus!.length; j++)
                  ListTile(
                    // onTap: () {
                    //   removeorder(
                    //       lis.menusections![0], lis.menusections![0].menus![j]);
                    //   setState(() {});
                    // },
                    title: Text(
                      (lis.menusections![0].menus![j].n ?? "").toCapitalized(),
                      style: Fonts.normal(
                          style: TextStyle(
                        color: ncolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                    leading: order.menu.menusections![0].menus![j].i != null
                        ? CircleAvatar(
                            radius: 20.r,
                            backgroundImage: CachedNetworkImageProvider(
                                order.menu.menusections![0].menus![j].i!),
                          )
                        : null,
                    subtitle: Text(
                      lis.menusections![0].menus![j].s ?? "",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: scolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                    trailing: Text(
                      lis.menusections![0].menus![j].p == null
                          ? ""
                          : lis.menusections![0].menus![j].p!.isEmpty
                              ? ""
                              : lis.menusections![0].menus![j].p!
                                      .startsWith(" x ")
                                  ? lis.menusections![0].menus![j].p!
                                  : "₹${lis.menusections![0].menus![j].p!}",
                      style: Fonts.normal(
                          style: TextStyle(
                        color: pcolor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                  ),
                SizedBox(height: 20.h),
                Container(
                  child: Row(
                    children: [
                      OutlinedButton.icon(
                          onPressed: () async {
                            await FireDB.menuOrderinstance
                                .column('val')
                                .row('id', order.id.toString())
                                .setstring("r");
                            Get.back();
                            setState(() {});
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                          label: Text(
                            "Reject",
                            style: Fonts.normal(
                                style: TextStyle(color: Colors.white)),
                          )),
                      OutlinedButton.icon(
                          onPressed: () async {
                            await FireDB.menuOrderinstance
                                .column('val')
                                .row('id', order.id.toString())
                                .setstring("d");
                            Get.back();
                            setState(() {});
                          },
                          icon: Icon(Icons.done_all, color: Colors.blue),
                          label: Text(
                            "Delivered",
                            style: Fonts.normal(
                                style: TextStyle(color: Colors.white)),
                          )),
                      OutlinedButton.icon(
                          onPressed: () async {
                            await FireDB.menuOrderinstance
                                .column('val')
                                .row('id', order.id.toString())
                                .setstring("s");
                            Get.back();
                            setState(() {});
                            // Get.to(PrintTO());
                          },
                          icon: Icon(Icons.done, color: Colors.green),
                          label: Text(
                            "Accept",
                            style: Fonts.normal(
                                style: TextStyle(color: Colors.white)),
                          )),
                      IconButton(
                        onPressed: () async {
                          // Get.to(PrintTO());
                        },
                        icon: Icon(Icons.print, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    // setd();
    // WorkControllAdmin.instance.menuLastnotys.listen((p0) {
    //   setState(() {});
    // });
    if (widget.qrorder != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        openbt(widget.qrorder!);
      });
    }
  }

  // setd() async {
  //   now = DateTime.parse(await FireDB.postinstance.getdatenow());
  // }

  // DateTime now = DateTime.now();
  setdate(List<WorkspotsMenuOrder> lis) async {
    var now = DateTime.parse(await FireDB.postinstance.getdatenow());
    // var lowlis = lis
    //     .where((e) =>
    var liss =
        workspotsMenuOrderFromJsonList(workspotsMenuOrderToJsonList(lis));
    liss.sort((a, b) {
      return DateTime.parse(a.createdAt!)
          .compareTo(DateTime.parse(b.createdAt!));
    });
    //         now.difference(DateTime.parse(e.createdAt!)).inHours.abs() > 24)
    //     .toList();
    for (var sx in liss) {
      // if (lowlis.isNotEmpty) {
      // var sx = lowlis[0];
      await Future.delayed(Duration(seconds: 3));
      var dif = now.difference(DateTime.parse(sx.createdAt!)).inHours.abs();
      if (dif > 23) {
        var e = await FireDB.menuOrderinstance.del({'id': sx.id.toString()});
        printer(e);
        // }
      }
    }
  }

  openbt(WorkspotsMenuOrder order) {
    btSheet(children: [
      sectAfterorder(order),
      Center(
        child:
            Text(DateFormat.yMMMd().format(DateTime.parse(order.createdAt!))),
      ),
      Center(
        child: Text(
            DateFormat("hh:mm a").format(DateTime.parse(order.createdAt!))),
      ),
      SizedBox(height: 10.h),
      Center(child: getval(order.val)),
      SizedBox(height: 10.h),
      Center(
        child: Text(
          "Table No. ${order.tid}",
          style: Fonts.normal(style: TextStyle(color: Colors.red)),
        ),
      ),
      SizedBox(height: 25.h),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(title: "Menu Orders", actions: [
        // IconButton(
        //     onPressed: () async {
        //       double volume = 1.0;
        //       double pitch = 1.0;
        //       double rate = 0.5; //speed
        //       FlutterTts ft = FlutterTts();
        //       await ft.setVolume(volume);
        //       await ft.setSpeechRate(rate);
        //       await ft.setPitch(pitch);
        //       await ft.setLanguage("en");
        //       // for (var r = 0; r < (GetStorage().read("ttsrpt") ?? 2); r++) {
        //       await ft.speak("hii");
        //     },
        //     icon: Icon(Icons.abc)),
        IconButton(
            onPressed: () async {
              // if (!WorkControllAdmin.instance.isexpired.value) {
              WorkspotsMenu menu = workspotsMenuFromJson(
                  await FireDB.menuinstance.getoneby({
                "spotid": WorkControll.instance.user.value.id.toString()
              }));
              btSheet(children: [
                StatefulBuilder(builder: (c, seter) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: SwitchListTile(
                          onChanged: (s) async {
                            // await Get.to(ReqMembersView(section: section));
                            if (menu.isorder!) {
                              await FireDB.menuinstance
                                  .column('isorder')
                                  .row('id', menu.id.toString())
                                  .setstring("f");
                            } else {
                              await FireDB.menuinstance
                                  .column('isorder')
                                  .row('id', menu.id.toString())
                                  .setstring("s");
                            }
                            menu = workspotsMenuFromJson(
                                await FireDB.menuinstance.getoneby({
                              "spotid":
                                  WorkControll.instance.user.value.id.toString()
                            }));
                            seter(() {});
                          },
                          title: Text(
                              menu.isorder! ? "Order enabled" : "Order closed"),
                          // groupValue: null,
                          value: menu.isorder ?? true,

                          // subtitle: Text(section.about ?? ""),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: SwitchListTile(
                          onChanged: (s) async {
                            // await Get.to(ReqMembersView(section: section));
                            // if ((GetStorage().read("ttsnoty") ?? true)) {
                            GetStorage().write("ttsnoty", s);
                            // } else {
                            //   GetStorage().write("ttsnoty", s);
                            // }
                            seter(() {});
                          },
                          title: Text((GetStorage().read("ttsnoty") ?? true)
                              ? "Notification voice enabled"
                              : "Notification voice disabled"),
                          // groupValue: null,
                          value: (GetStorage().read("ttsnoty") ?? true),

                          // subtitle: Text(section.about ?? ""),
                        ),
                      ),
                      PopupMenuButton<String>(
                        child: ListTile(
                          title: Text(
                              (GetStorage().read("ttslng") ?? "e") == "e"
                                  ? "English"
                                  : "Malayalam"),
                          subtitle: Text("order voice language"),
                        ),
                        initialValue: GetStorage().read("ttslng") ?? "e",
                        // Callback that sets the selected popup menu item.
                        onSelected: (String item) {
                          // setState(() {
                          GetStorage().write("ttslng", item);
                          seter(() {});
                          // });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: "e",
                            child: Text('English'),
                          ),
                          const PopupMenuItem<String>(
                            value: "m",
                            child: Text('Malayalam'),
                          ),
                        ],
                      ),
                      // PopupMenuButton<int>(
                      //   child: ListTile(
                      //     title: Text((GetStorage().read("ttsrpt") ?? 2) == 1
                      //         ? "1 Times"
                      //         : "2 Times"),
                      //     subtitle: Text("Voice repeat"),
                      //   ),
                      //   initialValue: GetStorage().read("ttsrpt") ?? 2,
                      //   // Callback that sets the selected popup menu item.
                      //   onSelected: (int item) {
                      //     // setState(() {
                      //     GetStorage().write("ttsrpt", item);
                      //     seter(() {});
                      //     // });
                      //   },
                      //   itemBuilder: (BuildContext context) =>
                      //       <PopupMenuEntry<int>>[
                      //     const PopupMenuItem<int>(
                      //       value: 1,
                      //       child: Text('1 Times'),
                      //     ),
                      //     const PopupMenuItem<int>(
                      //       value: 2,
                      //       child: Text('2 Times'),
                      //     ),
                      //   ],
                      // ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: SwitchListTile(
                          onChanged: (s) async {
                            // await Get.to(ReqMembersView(section: section));
                            // if ((GetStorage().read("ttsall") ?? true)) {
                            GetStorage().write("ttsall", s);
                            // } else {
                            //   GetStorage().write("ttsall", true);
                            // }
                            seter(() {});
                          },
                          title: Text((GetStorage().read("ttsall") ?? true)
                              ? "All food be said by voice enabled"
                              : "All food be said by voice disabled"),
                          // groupValue: null,
                          value: (GetStorage().read("ttsall") ?? true),

                          // subtitle: Text(section.about ?? ""),
                        ),
                      ),
                      SizedBox(height: 60.h),
                    ],
                  );
                })
              ]);
              // }
            },
            icon: Icon(Icons.settings, color: Colors.white))
      ]),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 4.h),
        child: FutureBuilder(
          // key: ValueKey(Random().nextInt(10000).toString()),
          future: getm(),
          builder: (c, s) {
            if (s.hasData) {
              var menlis = s.data!;
              // setdatex(menlis);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var order in menlis)
                    Container(
                      margin: EdgeInsets.all(7.r),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: () async {
                          openbt(order);
                        },
                        child: Ink(
                            // height: 80.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(20.r)
                                // border: Border(
                                //   bottom: BorderSide(color: Colors.grey[700]!),
                                // ),
                                ),
                            child: ListTile(
                                title: Text(
                                  ("${order.menu.menusections![0].menus![0].n}....etc")
                                      .toCapitalized(),
                                  style: Fonts.normal(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp)),
                                ),
                                subtitle: Text(
                                  "Table no : ${order.tid}",
                                  style: Fonts.pricetitle(
                                      style: TextStyle(color: Colors.red[400])),
                                ),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat.yMMMd().format(
                                          DateTime.parse(order.createdAt!)),
                                      style: Fonts.normal(
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 7.sp)),
                                    ),
                                    Text(
                                      DateFormat("hh:mm a").format(
                                          DateTime.parse(order.createdAt!)),
                                      style: Fonts.normal(
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 7.sp)),
                                    ),
                                    SizedBox(height: 4.h),
                                    getval(order.val),
                                  ],
                                ))),
                      ),
                    ),
                  SizedBox(
                    height: 300.h,
                  )
                ],
              );
            } else {
              return Container(
                height: 200.h,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              );
            }
          },
        ),
      )),
    );
  }
}

getval(String? val) {
  return val == null
      ? Text(
          "Pending...",
          style: Fonts.normal(
              style: TextStyle(color: Colors.blue, fontSize: 12.sp)),
        )
      : val == "c"
          ? Text(
              "Cancelled",
              style: Fonts.normal(
                  style: TextStyle(color: Colors.red, fontSize: 12.sp)),
            )
          : val == "s"
              ? Text(
                  "Accepted",
                  style: Fonts.normal(
                      style: TextStyle(color: Colors.green, fontSize: 12.sp)),
                )
              : val == "f"
                  ? Text(
                      "Pending...",
                      style: Fonts.normal(
                          style:
                              TextStyle(color: Colors.blue, fontSize: 12.sp)),
                    )
                  : val == "d"
                      ? Text(
                          "Delivered",
                          style: Fonts.normal(
                              style: TextStyle(
                                  color: Colors.green, fontSize: 12.sp)),
                        )
                      : val == "r"
                          ? Text(
                              "Rejected",
                              style: Fonts.normal(
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12.sp)),
                            )
                          : Text(
                              "Rejected",
                              style: Fonts.normal(
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12.sp)),
                            );
}
