import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:dinesync/Database/Fire/fireDB.dart';
import 'package:dinesync/Theme/fonts.dart';
import 'package:dinesync/Theme/images.dart';
import 'package:dinesync/Theme/textfiealds.dart';
import 'package:dinesync/layouts/AccountLayout/AccountPage/accountbody.dart';
import 'package:dinesync/layouts/phonesignin.dart';
import 'package:dinesync/models/workspotsaccount.dart';
import 'package:dinesync/workcontroll.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:icons_plus/icons_plus.dart';
import 'package:uni_links/uni_links.dart';
// import 'package:workspots/FireFCM/setup.dart';
// import 'package:workspots/FirebaseActions/googlesignin.dart';
// import 'package:workspots/Layouts/HomeLayout/homelayout.dart';
// import 'package:workspots/Layouts/MainLayout/mainlayout.dart';
// import 'package:workspots/Layouts/MainLayout/oper.dart';
// import 'package:workspots/Database/LocalDB/localdb.dart';
// import 'package:workspots/Database/dataposting.dart';
// import 'package:workspots/Layouts/PhoneSignPage/phonesignpage.dart';
// import 'package:workspots/Theme/fonts.dart';
// import 'package:workspots/Theme/images.dart';
// import 'package:workspots/main.dart';
// import 'package:workspots/workcontroll.dart';

class SigningLayout extends StatefulWidget {
  SigningLayout({super.key, required this.onset});
  void Function() onset;

  @override
  State<SigningLayout> createState() => _SigningLayoutState();
}

class _SigningLayoutState extends State<SigningLayout> {
  String us = "";
  String ps = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 22, 22, 22),
            Colors.black,
          ],
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin:
            EdgeInsets.only(top: 90.h, bottom: 90.h, left: 10.w, right: 10.w),
        elevation: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                child: Column(children: [
              Image.asset(
                ImageAssets.workspotlogo,
                height: 80.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text("DineSync",
                  style: Fonts.secondary(
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            ])),
            TextFields.getOutlinedField(
                controller: new TextEditingController(),
                label: "username",
                textype: TextInputType.name,
                onChanged: (s) {
                  us = s;
                }),
            TextFields.getOutlinedField(
                controller: new TextEditingController(),
                label: "password",
                textype: TextInputType.name,
                onChanged: (s) {
                  ps = s;
                }),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: StadiumBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      child: Icon(
                        Icons.person,
                        size: 30.r,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Sign In as user",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                // by onpressed we call the function signup function
                onPressed: () async {
                  var dxx = workspotsAccountFromJsonList(await FireDB
                      .accountinstance
                      .getallby({'name': us, 'password': ps}));
                  if (dxx.length == 0) {
                    GetStorage().write("login", "s");
                    GetStorage().write("us", us);
                    GetStorage().write("ps", ps);
                    WorkspotsAccount ac = WorkspotsAccount(
                        name: us, isuser: "f", phonenumber: ps);
                    await FireDB.accountinstance.set(ac.toJson());
                    var dx = await FireDB.accountinstance
                        .getoneby({'name': us, 'password': ps});
                    WorkControll.instance.user.value =
                        workspotsAccountFromJson(dx);
                    Get.to(AccountBody());
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: StadiumBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      child: Icon(
                        Icons.business,
                        size: 30.r,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Sign In as admin",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                // by onpressed we call the function signup function
                onPressed: () async {
                  var dxx = workspotsAccountFromJsonList(await FireDB
                      .accountinstance
                      .getallby({'name': us, 'password': ps}));
                  if (dxx.length == 0) {
                    GetStorage().write("login", "s");
                    GetStorage().write("us", us);
                    GetStorage().write("ps", ps);
                    WorkspotsAccount ac = WorkspotsAccount(
                        name: us, isuser: "f", phonenumber: ps);
                    await FireDB.accountinstance.set(ac.toJson());
                    var dx = await FireDB.accountinstance
                        .getoneby({'name': us, 'password': ps});
                    WorkControll.instance.user.value =
                        workspotsAccountFromJson(dx);
                    Get.to(AccountBody());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
