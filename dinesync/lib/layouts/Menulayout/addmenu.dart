import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinesync/layouts/Searchimage/searchgetimger.dart';
import 'package:dinesync/workcontroll.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinesync/Database/Fire/fireDB.dart';
import 'package:dinesync/Database/dataposting.dart';
import 'package:dinesync/Layouts/Menulayout/QrCard/qrcard.dart';
import 'package:dinesync/Layouts/Menulayout/menulayout.dart';
// import 'package:dinesync/Layouts/Searchimage/searchgetimger.dart';
import 'package:dinesync/Models/workspotsMenu.dart';
import 'package:dinesync/Theme/appbar.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:dinesync/Theme/showsnack.dart';
import 'package:dinesync/Theme/textfiealds.dart';
// import 'package:dinesync/WorkControllAdmin.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key, required this.menu});
  final WorkspotsMenu menu;

  @override
  State<AddMenu> createState() => _AddMenuState(menu);
}

class _AddMenuState extends State<AddMenu> {
  _AddMenuState(this.menu);
  WorkspotsMenu menu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            // if (menu.img == null) {
            //   showsnack("select an image");
            //   return;
            // }
            // if (menu.img!.isEmpty) {
            //   showsnack("select an image");
            //   return;
            // }
            if (menu.name == null) {
              showsnack("name cannot be empty");
              return;
            }
            if (menu.name!.isEmpty) {
              showsnack("name cannot be empty");
              return;
            }
            for (var vr in menu.menusections!) {
              if (vr.name == null) {
                showsnack("all item name cannot be empty");
                return;
              }
              if (vr.name!.isEmpty) {
                showsnack("all item name cannot be empty");
                return;
              }
              for (var vrm in vr.menus!) {
                // if (vrm.s == null) {
                //   return;
                // }
                if (vrm.n == null) {
                  showsnack("all item name cannot be empty");
                  return;
                }
                // if (vrm.p == null) {
                //   return;
                // }
                if (vrm.n!.isEmpty) {
                  showsnack("all item name cannot be empty");
                  return;
                }
                // if (vrm.s!.isEmpty) {
                //   return;
                // }
                // if (vrm.p!.isEmpty) {
                //   return;
                // }
              }
            }
            // showsnack("msg");
            // if (!menu.img!.startsWith("http")) {
            //   var ds = await postFile(File(menu.img!),
            //       "menus/" + WorkControll.instance.user.value.id.toString());
            //   menu.img = ds;
            // }
            if (menu.spotid == null) {
              menu.spotid = WorkControll.instance.user.value.id.toString();
            }
            await FireDB.menuinstance.set(menu.toJson(),
                key: menu.id == null ? '' : 'id',
                value: menu.id == null ? '' : menu.id.toString());
            Get.back();
          },
          label: Text("Edit Menu")),
      appBar: appBar(
        title: "Menu",
        actions: [
          if (menu.id != null)
            IconButton(
              onPressed: () {
                Get.to(MenuQrCard(menu: menu));
              },
              icon: Icon(Icons.share),
            )
        ],
      ),
      backgroundColor: Colors.white,
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
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
                              child: GestureDetector(
                                onTap: () async {
                                  // ImagePicker picker = ImagePicker();
                                  // var ff = await picker.pickImage(
                                  //     source: ImageSource.gallery);
                                  // if (ff != null) {
                                  //   setState(() {
                                  //     menu.img = ff.path;
                                  //   });
                                  // }
                                },
                                child: Container(
                                  height: 300.h,
                                  color: Colors.black.withOpacity(0.4),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Card(
                          color: Colors.blue[600],
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: ListTile(
                              onTap: () {
                                Get.to(MenuLayout(
                                  menu: menu,
                                  onSelect: (s) {
                                    Get.back();
                                    menu.desid = s;
                                  },
                                ));
                              },
                              title: Text(
                                "Change Design",
                                style: TextStyle(color: Colors.white),
                              ),
                              // subtitle: Text(
                              //     "${section.answerdatas!.where((e) => e.accepted == 's').length} members"),
                              trailing: Icon(Icons.arrow_forward_rounded),
                              // subtitle: Text(section.about ?? ""),
                            ),
                          ),
                        ),
                      ),
                      for (var i = 0; i < menu.menusections!.length; i++)
                        menusect(i),
                      SizedBox(height: 30.h),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber[700]),
                          onPressed: () {
                            setState(() {
                              menu.menusections!.add(Menusection(menus: []));
                            });
                          },
                          child: Text("Add Section")),
                      SizedBox(height: 100.h),
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
    return Container(
      margin: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Card(
        child: Container(
            padding: EdgeInsets.all(8.w),
            child: Column(
              children: [
                TextField(
                  controller: TextEditingController(
                      text: menu.menusections![i].name ?? ""),
                  onChanged: (s) {
                    menu.menusections![i].name = s;
                  },
                  maxLength: 20,
                  style: TextStyle(fontSize: 17.sp),
                  decoration: InputDecoration(
                      counterText: "",
                      hintStyle: TextStyle(fontSize: 17.sp),
                      border: InputBorder.none,
                      hintText: "Section name"),
                  // autofocus: true,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                ),
                for (var j = 0; j < menu.menusections![i].menus!.length; j++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: GestureDetector(
                            onTap: () async {
                              Get.to(SearchImageOne(
                                  str:
                                      "${menu.menusections![i].menus![j].n ?? ""} ${menu.menusections![i].menus![j].s ?? ""}",
                                  onSelect: (ff) {
                                    Get.back();
                                    setState(() {
                                      menu.menusections![i].menus![j].i = ff;
                                    });
                                  }));
                            },
                            child: menu.menusections![i].menus![j].i == null
                                ? CircleAvatar(
                                    radius: 17.r,
                                    backgroundColor: Colors.grey[400],
                                  )
                                : menu.menusections![i].menus![j].i!
                                        .startsWith("http")
                                    ? CircleAvatar(
                                        radius: 17.r,
                                        backgroundImage:
                                            CachedNetworkImageProvider(menu
                                                .menusections![i].menus![j].i!))
                                    : CircleAvatar(
                                        radius: 17.r,
                                        backgroundImage: FileImage(File(menu
                                            .menusections![i].menus![j].i!))),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: TextEditingController(
                              text: menu.menusections![i].menus![j].n ?? ""),
                          onChanged: (s) {
                            menu.menusections![i].menus![j].n = s;
                          },
                          maxLength: 20,
                          style: TextStyle(fontSize: 12.sp),
                          decoration: InputDecoration(
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 12.sp),
                              border: InputBorder.none,
                              hintText: "name"),
                          textAlign: TextAlign.start,
                          // autofocus: true,
                          keyboardType: TextInputType.name,
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: TextEditingController(
                              text: menu.menusections![i].menus![j].s ?? ""),
                          onChanged: (s) {
                            menu.menusections![i].menus![j].s = s;
                          },
                          maxLength: 20,
                          style: TextStyle(fontSize: 12.sp),
                          decoration: InputDecoration(
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 12.sp),
                              border: InputBorder.none,
                              hintText: "subtitle"),
                          textAlign: TextAlign.start,
                          // autofocus: true,
                          keyboardType: TextInputType.name,
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          // style: TextStyle(fontSize: 12.sp),
                          controller: TextEditingController(
                              text: menu.menusections![i].menus![j].p ?? ""),
                          onChanged: (s) {
                            menu.menusections![i].menus![j].p = s;
                            if (int.tryParse(s) == null) {
                              // if (menu.menusections![i].menus![j].h == true) {
                              //   setState(() {
                              //     menu.menusections![i].menus![j].h = false;
                              //   });
                              // }
                            }
                          },
                          maxLength: 20,
                          style: TextStyle(fontSize: 12.sp),
                          decoration: InputDecoration(
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 12.sp),
                              border: InputBorder.none,
                              hintText: "Price"),
                          textAlign: TextAlign.start,
                          // autofocus: true,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                menu.menusections![i].menus!.removeAt(j);
                              });
                            },
                            icon: Icon(Icons.close)),
                      ),
                    ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            menu.menusections![i].menus!.add(Menu());
                          });
                        },
                        child: Text("Add Item")),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            menu.menusections!.removeAt(i);
                          });
                        },
                        child: Text("remove section")),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
