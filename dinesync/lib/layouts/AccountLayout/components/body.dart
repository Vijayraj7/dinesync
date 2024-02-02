import 'dart:io';

import 'package:dinesync/Models/workspotsMenu.dart';
import 'package:dinesync/layouts/Menulayout/addmenu.dart';
// import 'package:dinesync/models/workspotsMenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:dinesync/Database/Fire/fireDB.dart';
// import 'package:dinesync/Database/LocalDB/localdb.dart';
import 'package:dinesync/Database/dataposting.dart';
// import 'package:dinesync/Database/encapp.dart';
import 'package:dinesync/Layouts/AccountLayout/AccountPage/accountbody.dart';
// import 'package:dinesync/Layouts/CollectionLayout/collectionlayout.dart';
// import 'package:dinesync/Layouts/ContactPage/contactpage.dart';
// import 'package:dinesync/Layouts/NotificationsLayout/notificationslayout.dart';
// import 'package:dinesync/Layouts/OrderPage/orderpage.dart';
// import 'package:dinesync/Layouts/PhoneSignPage/phonesignpage.dart';
// import 'package:dinesync/Layouts/UserSectionslayout/usersectionlayout.dart';
// import 'package:dinesync/Layouts/UserSectionslayout/usersectionlayoutrequests.dart';
// import 'package:dinesync/Layouts/Webprv/webprv.dart';
// import 'package:dinesync/MAIN/p/p.dart';
// import 'package:dinesync/Models/dinesyncaccount.dart';
// import 'package:dinesync/Models/dinesyncSpots.dart';
import 'package:dinesync/Theme/btsheet.dart';
import 'package:dinesync/Theme/fonts.dart';
import 'package:dinesync/Theme/images.dart';
import 'package:dinesync/main.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:dinesyncadmin/WorkControllAdmin.dart';
// import 'package:dinesyncadmin/main.dart' as admin;
// import 'package:dinesyncadmin/Layouts/MainLayout/mainlayout.dart' as adm;
// import 'package:dinesyncadmin/Models/dinesyncSpots.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    printer(WorkControll.instance.user.value.phonenumber);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              // final ImagePicker _picker = ImagePicker();
              // Pick an image
              // final XFile? image =
              //     await _picker.pickImage(source: ImageSource.gallery);
              // if (image != null) {
              //   var d = await postFile(File(image.path),
              //       LocalDB.instance.user.value.id.toString());
              //   await FireDB.accountinstance
              //       .column('imageurl')
              //       .row('id', LocalDB.instance.user.value.id.toString())
              //       .setstring(d);
              //   LocalDB.instance.user.value = dinesyncAccountFromJson(
              //       await FireDB.accountinstance.getoneby({
              //     'phonenumber': FirebaseAuth.instance.currentUser!.phoneNumber
              //   }));
              setState(() {});
              // }
            },
            child: ProfilePic(),
          ),
          SizedBox(height: 20),
          Center(
              child: Text(
            WorkControll.instance.user.value.name ?? "",
            style: Fonts.normal(
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
          )),
          Center(
              child: Text(
            WorkControll.instance.user.value.phonenumber ?? "",
            style: Fonts.normal(
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
          )),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            // icon: "assets/icons/Settings.svg",
            icon: Icons.person,
            press: () {
              Get.to(AccountBody());
            },
          ),
          // ProfileMenu(
          //   text: "Sections",
          //   // icon: "assets/icons/Settings.svg",
          //   icon: Icons.people,
          //   press: () {
          //     Get.to(UserSectionLayout());
          //   },
          // ),
          ProfileMenu(
            text: "Service Requests",
            // icon: "assets/icons/Settings.svg",
            icon: Icons.people,
            press: () {
              // Get.to(UserSectionLayoutRequests());
            },
          ),
          // if (WorkControllAdmin.instance.spot.value.id != null)
          //   ProfileMenu(
          //     text: "Your Store",
          //     // icon: "assets/icons/Bell.svg",
          //     icon: Bootstrap.shop,
          //     press: () async {
          //       await admin.initControll(admin.WorkControllAdmin.instance);
          //       Get.to(admin.MyApp());
          //     },
          //   ),
          // if (WorkControllAdmin.instance.spot.value.id == null)
          //   ProfileMenu(
          //     text: "Request Store",
          //     // icon: "assets/icons/Bell.svg",
          //     icon: Bootstrap.shop,
          //     press: () async {
          //       await admin.initControll(admin.WorkControllAdmin.instance);
          //       Get.to(admin.MyApp());
          //     },
          //   ),
          // ProfileMenu(
          //   text: "Orders",
          //   length: (WorkControll.instance.wrqsts
          //           .where((e) => e.val == "s" || e.val == "d")
          //           .toList()
          //           .length +
          //       WorkControll.instance.rqsts
          //           .where((e) => e.val == "s" || e.val == "d")
          //           .toList()
          //           .length),
          //   // icon: "assets/icons/User Icon.svg",
          //   icon: Icons.shopping_bag_outlined,
          //   press: () {
          //     Get.to(OrderPage(rqsts: false));
          //   },
          // ),
          // ProfileMenu(
          //   text: "Requests",
          //   length: (WorkControll.instance.wrqsts
          //           .where((e) => e.val == null || e.val == "f")
          //           .toList()
          //           .length +
          //       WorkControll.instance.rqsts
          //           .where((e) => e.val == null || e.val == "f")
          //           .toList()
          //           .length),
          //   // icon: "assets/icons/User Icon.svg",
          //   icon: Icons.send_rounded,
          //   press: () {
          //     Get.to(OrderPage(rqsts: true));
          //   },
          // ),
          // ProfileMenu(
          //   text: "Collections",
          //   // icon: "assets/icons/Bell.svg",
          //   icon: Bootstrap.collection,
          //   // length: LocalDB.instance.seenotys.length,
          //   press: () {
          //     Get.to(CollectionLayout());
          //   },
          // ),
          // ProfileMenu(
          //   text: "Notifications",
          //   // icon: "assets/icons/Bell.svg",
          //   icon: Bootstrap.bell,
          //   length: LocalDB.instance.seenotys.length,
          //   press: () {
          //     Get.to(NotificationLayout());
          //   },
          // ),
          // ProfileMenu(
          //   text: "dinesync Business",
          //   // icon: "assets/icons/Bell.svg",
          //   icon: Bootstrap.shop,
          //   press: () async {
          //     // var ii = dinesyncSpotsFromJson(
          //     //     await FireDB.spotinstance.getoneby({'id': '1610113'}));
          //     // Get.to(adm.MainLayout(
          //     //   spot: ii,
          //     // ));
          //   },
          // ),
          // ProfileMenu(
          //   text: "Settings",
          //   // icon: "assets/icons/Settings.svg",
          //   icon: Icons.settings,
          //   press: () {
          //     btShee(children: [
          //       ListTile(
          //         onTap: () {
          //           Get.to(PhoneSignInPage());
          //         },
          //         title: Text("Change Phone number"),
          //       ),
          //       // ListTile(
          //       //   onTap: () {
          //       //     Get.to(PhoneSignInPage());
          //       //   },
          //       //   title: Text("Change Phone number"),
          //       // ),
          //     ]);
          //   },
          // ),
          // ProfileMenu(
          //   text: "Help Center",
          //   // icon: "assets/icons/Question mark.svg",
          //   icon: Icons.help_outline_outlined,
          //   press: () {
          //     Get.to(ContactPage());
          //   },
          // ),
          SizedBox(height: 40.h),
          ListTile(
              onTap: () {
                // Get.to(ContactPage());
              },
              leading: Icon(Icons.help),
              title: Text('Contact')),
          ListTile(
            leading: Icon(Icons.lock),
            title: const Text('Privacy-Policy'),
            onTap: () {
              WorkspotsMenu men = WorkspotsMenu(
                  menutables: [],
                  menusections: [],
                  spotid: WorkControll.instance.user.value.id.toString());
              Get.to(AddMenu(menu: men));
              // Get.to(WebPRV(
              //     url: 'https://web.dinesync.in/privacy.html',
              //     title: 'Privacy Policy'));
              // FirebaseMessaging.instance.subscribeToTopic(
              //     WorkControll.instance.spot.value.id.toString());
              // NotificationApi.showNotification();
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: const Text('Terms & Conditions'),
            onTap: () {
              // Get.to(WebPRV(
              //     url: 'https://web.dinesync.in/terms.html',
              //     title: 'Terms & Conditions'));
              // FirebaseMessaging.instance.subscribeToTopic(
              //     WorkControll.instance.spot.value.id.toString());
              // sendSpotPost(WorkControll.instance.posts[0]);
              // Update the state of the app.
              // ...
            },
          ),
          // Divider(),
          // ListTile(leading: Icon(Icons.settings), title: Text('Facebook')),
          // Spacer(),
          SizedBox(height: 40.h),
          Container(
            padding: EdgeInsets.all(10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("from", style: Fonts.primary()),
                SizedBox(
                  width: 17.w,
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        ImageAssets.forvf,
                        width: 40.w,
                      ),
                      // SizedBox(
                      //   height: 5.w,
                      // ),
                      Text("FORV",
                          style: Fonts.secondary(
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue[800]))),
                    ],
                  ),
                ),
              ],
            ),
            // leading:
            // title: ,
            // subtitle: Container(
            //     child: Image.asset(
            //   ImageAssets.xlooplogo,
            //   width: 3.w,
            // )),
          )
          // ProfileMenu(
          //   text: "Log Out",
          //   // icon: "assets/icons/Log out.svg",
          //   icon: Icons.logout,
          //   press: () async {
          //     await FirebaseAuth.instance.signOut();
          //     await GoogleSignIn().signOut();
          //     clearsub();
          //     await Get.offAll(MainApp());
          //   },
          // ),
        ],
      ),
    );
  }
}
